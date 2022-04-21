JSONObject json;
color flower;
float nuagex=0;
float nuagey=0;

void setupJSON(){
//fichier json
  json = loadJSONObject("data.json");
  nuagex=json.getFloat("nuagex");
  nuagey=json.getFloat("nuagey");
  flower= color(json.getInt("flowerR"), json.getInt("flowerG"), json.getInt("flowerB"));
}
