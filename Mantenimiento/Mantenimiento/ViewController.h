//
//  ViewController.h
//  Mantenimiento
//
//  Created by Juan Pestana on 6/21/15.
//  Copyright (c) 2015 DPSoftware. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapa;
- (IBAction)otro:(id)sender;

- (IBAction)semaforo:(id)sender;
- (IBAction)hueco:(id)sender;

- (IBAction)luminaria:(id)sender;



@end

