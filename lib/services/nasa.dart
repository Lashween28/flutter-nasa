import 'package:flutter_nasa/models/nasa_manifest.dart';
import 'package:flutter_nasa/models/nasa_rover_photos.dart';
import 'package:http/http.dart' as http;

///
/// Common header for the Nasa Api
///
const String apiKey = "DEMO_KEY";
Uri _constructEndpointUri(
    {required String path, Map<String, dynamic>? queryParams}) {
  Map<String, dynamic> params = queryParams ?? {};
  if (!params.containsKey("api_key")) {
    params["api_key"] = apiKey;
  }
  return Uri(
      scheme: "https",
      host: "api.nasa.gov",
      pathSegments: ["/mars-photos/api/v1", path],
      queryParameters: params);
}

class NasaService {
  ///
  ///Get the rover photos from endpoint <br/>
  ///Params:  <br/>
  ///`rover` - the rover name<br/>
  ///`sol` - the time in SOL unit<br/>
  ///`camera` - the camera where the image should be obtained<br/>
  ///
  static Future<NasaRoverPhotos> getRoverPhotos(
      String rover, int sol, RoverCamera? camera) async {
    http.Response response = await http.get(
      _constructEndpointUri(
        path: "/rovers/$rover/photos",
        queryParams: {"sol": sol, "camera": camera},
      ),
    );
    if (response.statusCode != 200) {
      throw Exception("Request failed");
    }
    return NasaRoverPhotos.fromJson(response.body);
  }

  static Future<NasaRoverManifest> getRoverManifest(String rover) async {
    http.Response response = await http.get(
      _constructEndpointUri(
        path: "/manifests/$rover",
      ),
    );
    if (response.statusCode != 200) {
      throw Exception("Request failed");
    }
    return NasaRoverManifest.fromJson(response.body);
  }
}
