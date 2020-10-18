//
//  APIManager.m
//  AviaSalesConcept
//
//  Created by Kirill Khudiakov on 17.10.2020.
//

#import "APIManager.h"


#define API_TOKEN @"0b4689974a57562005b394a0bd26a121"
#define API_URL_IP_ADDRESS @ "https://api.ipify.org/?format=json"
#define API_URL_CHEAP @ "https://api.travelpayouts.com/v1/prices/cheap"
#define API_URL_CITY_FROM_IP @ "https://www.travelpayouts.com/whereami?ip="
#define API_URL_MAP_PRICE @ "https://map.aviasales.ru/prices.json?origin_iata="

@implementation APIManager

+ (instancetype )shared {
    static APIManager* instance;
    static dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ APIManager   alloc ]  init];
    });
  return  instance;
}

- (void)ticketsWithRequest:(RequestCondition *)request withCompletion:(void (^)(NSArray * _Nonnull))completion {
    NSString *urlString = [NSString stringWithFormat : @"%@?%@&token=%@", API_URL_CHEAP, prepareQuery(request), API_TOKEN];
    [self load:urlString withCompletion :^(id _Nullable result) {  NSDictionary  *response = result;
        if (response) {
            NSDictionary  *jsonData = [response  valueForKey: @"data"];
            NSDictionary  *json = [jsonData valueForKey :request.destination];
            NSMutableArray  *array = [ NSMutableArray new ];
            if ([json respondsToSelector:@selector(count)]) {
                for (NSString *key in json) {
                    NSDictionary  *value = [json  valueForKey : key];
                    NSLog(@"json: %@", json);
//                    Ticket  *ticket = [[ Ticket alloc ] initWithDictionary :value]; ticket.from = request. origin ;
//                    ticket.to = request. destination ;
//                    [array addObject :ticket];
                }
            }
            dispatch_async ( dispatch_get_main_queue(), ^{
                completion(array);
            });
        }
    }];
}



- (void)cityForCurrentIP:( void  (^)( City *city))completion {
    [self IPAddressWithCompletion :^( NSString  *ipAddress) {
    [self load :[ NSString stringWithFormat : @"%@%@" , API_URL_CITY_FROM_IP, ipAddress] withCompletion :^( id   _Nullable  result) {
        NSDictionary  *json = result;
        NSString *iata = [json  valueForKey:   @"iata" ];
        if (iata) {
            City *city = [[DataManager shared] cityForIATA:iata];
            if  (city) {
                dispatch_async ( dispatch_get_main_queue (), ^{
                    completion(city);
                });
            }
        }}];
}]; }

#pragma mark - Support methods

- ( void )IPAddressWithCompletion:( void (^)( NSString  *ipAddress))completion {
    [self load: API_URL_IP_ADDRESS  withCompletion :^( id _Nullable result) {
        NSDictionary  *json = result;
        completion([json valueForKey : @"ip"]);
    }];
}

- (void) load: (NSString*) urlString withCompletion: (void (^) (id _Nullable result)) completion {
    dispatch_async (dispatch_get_main_queue(), ^{ [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible :YES] ;});
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error == nil) {
            dispatch_async (dispatch_get_main_queue(), ^{ [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible :NO] ;});
            completion([NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil]);
            
        }
    }];
    
    
    [task resume];

}


NSString* prepareQuery(RequestCondition* request) {
    NSString *result = [NSString stringWithFormat : @"origin=%@&destination=%@", request.origin,
                        request.destination];
    if (request.departDate && request.returnDate ) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init ];
        dateFormatter.dateFormat =  @"yyyy-MM";
        result = [NSString stringWithFormat: @"%@&depart_date=%@&return_date=%@" , result, [dateFormatter  stringFromDate :request.departDate ], [dateFormatter stringFromDate: request.returnDate ]];
    }
    return result;
}

@end
