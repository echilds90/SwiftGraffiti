import UIKit
import MapKit

// Sample UIView code which works great in the playground.
var myView:UIView = UIView();
myView.frame = CGRectMake(0, 0, 320, 560)
myView.backgroundColor = UIColor.blueColor()

// Non working map code - no errors but can't figure out what to call or initiate to get the view in the Quick Look side.

var mapView = MKMapView();
mapView.region.center.latitude = mapView.userLocation.coordinate.latitude;
mapView.region.center.longitude = mapView.userLocation.coordinate.longitude;
mapView.region.span.latitudeDelta = 0.00725;
mapView.region.span.longitudeDelta = 0.00725;
