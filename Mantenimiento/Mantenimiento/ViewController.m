//
//  ViewController.m
//  Mantenimiento
//
//  Created by Juan Pestana on 6/21/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//

#import "ViewController.h"

NSString *latitud;
NSString *longitud;
NSString *calle;
NSString *numero;
NSString *nombre;

@interface ViewController (){
    CLLocationManager *locationManager;
    CLLocationManager *startlocation;
    
    CLGeocoder *geocoder;
    CLPlacemark *placemark;


}
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    //PROCESOS DE LOCALIZACION
    locationManager = [[CLLocationManager alloc]init];
    [locationManager requestAlwaysAuthorization];
    [locationManager startUpdatingLocation];
    startlocation = nil;
    [locationManager startUpdatingLocation];
    locationManager.delegate = self;
    
    
    // PROCESOS DEL MAPVIEW
    _mapa.delegate = self;

}


// CONFIGURACION DEL CENTRO DEL MAPA
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    
    MKCoordinateRegion mapRegion;
    mapRegion.center = _mapa.userLocation.coordinate;
    mapRegion.span.latitudeDelta = 0.0025;
    mapRegion.span.longitudeDelta = 0.0025;
    
    
    [_mapa setRegion:mapRegion animated: YES];
    
    
}

// CONFIGURACION DE LOCATION
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    NSString *currentlatitude = [[NSString alloc]initWithFormat:@"%.6f", newLocation.coordinate.latitude];
    latitud = currentlatitude;
    NSString *currentlongitude = [[NSString alloc]initWithFormat:@"%.6f", newLocation.coordinate.longitude];
    longitud = currentlongitude;
    
    // DIRECCION
    CLLocation *currentLocation = newLocation;
    
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            
            
            calle = placemark.thoroughfare;
            numero = placemark.subThoroughfare;
            
        } else {
            NSLog(@"%@", error.debugDescription);
        }
    } ];
    
}


///////////////////////////////////////////////////////////////////////////////////////////////
// AQUI EMPIEZAN BOTONES


// SEMAFORO

- (IBAction)semaforo:(id)sender {
    
    nombre = @"Semaforo Malo";
    NSString *direccion = [NSString stringWithFormat:@"%@ %@", calle, numero];
    
    NSString *strURL = [NSString stringWithFormat:@"http://www.zubexdb.com/insertSanPedro.php?name=%@&address=%@&lat=%@&lng=%@", nombre, direccion, latitud, longitud];
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    NSString *strResult = [[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];
    NSLog(@"Correndenadas enviadas: %@", strResult);
}

// HUECO
- (IBAction)hueco:(id)sender {
    nombre = @"Hueco";
    NSString *direccion = [NSString stringWithFormat:@"%@ %@", calle, numero];
    
    NSString *strURL = [NSString stringWithFormat:@"http://www.zubexdb.com/insertSanPedro.php?name=%@&address=%@&lat=%@&lng=%@", nombre, direccion, latitud, longitud];
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    NSString *strResult = [[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];
    NSLog(@"Correndenadas enviadas: %@", strResult);
}

// LUMINARIA ROTA
- (IBAction)luminaria:(id)sender {
    nombre = @"Luminaria Mala";
    NSString *direccion = [NSString stringWithFormat:@"%@ %@", calle, numero];
    
    NSString *strURL = [NSString stringWithFormat:@"http://www.zubexdb.com/insertSanPedro.php?name=%@&address=%@&lat=%@&lng=%@", nombre, direccion, latitud, longitud];
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    NSString *strResult = [[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];
    NSLog(@"Correndenadas enviadas: %@", strResult);
}


// OTRO

- (IBAction)otro:(id)sender {
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"San Pedro" message:@"¿Qué problema quiere reportar?" delegate:self cancelButtonTitle:@"ENVIAR" otherButtonTitles:nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //NSLog(@"Entered: %@",[[alertView textFieldAtIndex:0] text]);
    
    NSString *texto = [NSString stringWithFormat:@"%@", [alertView textFieldAtIndex:0]];
    
    
    nombre = texto;
    NSString *direccion = [NSString stringWithFormat:@"%@ %@", calle, numero];
    
    NSString *strURL = [NSString stringWithFormat:@"http://www.zubexdb.com/insertSanPedro.php?name=%@&address=%@&lat=%@&lng=%@", nombre, direccion, latitud, longitud];
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    NSString *strResult = [[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];
    NSLog(@"Correndenadas enviadas: %@", strResult);
 
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
