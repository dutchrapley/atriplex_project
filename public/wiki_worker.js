wiki_search_term = "";
// hit the wikipedia server.
function makeServerRequest(search) {
  importScripts( "http://en.wikipedia.org/w/api.php?titles=" + search + "&format=json&callback=handleRequest&action=query&prop=imageinfo&iiprop=url&generator=images" );
}

// Callback for the JSONP result.
function handleRequest(objJSON) {
  if (objJSON == []) {

  } else {
    results = objJSON.query.pages;
    imgUrls = [];
    for (var k in results) {
      if (results.hasOwnProperty(k)) {
        url = results[k].imageinfo[0].url;
        found = url.match(wiki_search_term);
        if (found) {
          imgUrls.push(url);
        }
      }
    }
    // self.postMessage(wiki_search_term);
    self.postMessage(results);
    self.postMessage(imgUrls);
  }
 // self.close()
}

// message reciever
self.onmessage = function(e) {
  wiki_search_term = e.data;
  makeServerRequest(e.data);
};
