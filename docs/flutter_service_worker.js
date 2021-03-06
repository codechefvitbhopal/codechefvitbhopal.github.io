'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "22686410212256a8a0a84b55e3c9e62f",
"assets/assets/events/codeyessey.png": "69c5ffbef32e18aa3db8b235adf8071f",
"assets/assets/events/leaders_league.png": "56b9857ae0f68347c2647967340ac5da",
"assets/assets/events/resource_buffer.png": "e05246c1ea4a1473518f8d1b5b5ab8e3",
"assets/assets/facebook.png": "021ada146ffb7c1753557ff29618d04c",
"assets/assets/github.png": "d22ee3727a7216019c3848df6eafa024",
"assets/assets/images/about-us-dark.png": "3fa1a1bf152babd08b5833ef31cc0edc",
"assets/assets/images/about-us.png": "489ddf894a302b5513cf9c12e1b3fe44",
"assets/assets/images/cc_vit_chapter.png": "bbb8a1acaf6cd13c4ea3241ab123113a",
"assets/assets/images/cc_vit_chapter_dark.png": "0debf57d62f91f4828933c7acff538ff",
"assets/assets/images/events.png": "a5ddae6c0129b66fa373d3813379af54",
"assets/assets/images/events_dark.png": "98d65be33dc6d3e631dfa997fd6242cc",
"assets/assets/images/footer.png": "b1fc5263d60bcfc6271f39cd8ed5386c",
"assets/assets/images/footer_dark.png": "0c1e0d8cebd2b6e900ca7ef12b60111e",
"assets/assets/images/header.png": "4bf30acf53cd739fdf5f5ecae04cca1c",
"assets/assets/images/header_dark.png": "fbfbd98d25eb81241e1da23bbe828e42",
"assets/assets/images/header_small.png": "70be960c3141d75b327919c52a816bd2",
"assets/assets/images/header_small_dark.png": "dc8652e89f62b06c024bfde45bcf4ef7",
"assets/assets/images/main.png": "a8aa01b584b5fd2e8d96132e139df9e7",
"assets/assets/images/main_dark.png": "639fbdd78b962d2125aa294eb0eeebf0",
"assets/assets/images/teams.png": "f179b4fab2dae2db845b560935e2fcdd",
"assets/assets/instagram.png": "26631a4043b14dff84180bdf51c3cacb",
"assets/assets/linkedin.png": "926e2dcf5ab4220a359867614556df68",
"assets/assets/logo/ccwhite_shadow.png": "e29b3d74609bd980123dfc045a4e1f5a",
"assets/assets/logo/ccwhite_shadow_dark.png": "c7aaed108f9ad5297310856e464aaf70",
"assets/assets/logo/whiteLogo.png": "4169e2e5be8c3c78fcba793caba37216",
"assets/assets/medium.png": "fb86f4060325caef8ea1f0fad0d25f40",
"assets/assets/medium_light.png": "bd516690c99267a778885736015befe8",
"assets/assets/moon.png": "a270b8a10d1a9a52441bf5a322dd1b86",
"assets/assets/twitter.png": "8f35a40403a84631c4125c4f1859c7a6",
"assets/FontManifest.json": "a57f90fef1bfcc81e35dd6a9e40ef595",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/fonts/Segoe-UI.ttf": "0e7e9a9b5c4abaadef7bc8f4e4574084",
"assets/NOTICES": "a87b2286bc3d57dff573f9cc5396b7f9",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "831eb40a2d76095849ba4aecd4340f19",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "a126c025bab9a1b4d8ac5534af76a208",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "d80ca32233940ebadc5ae5372ccd67f9",
"favicon.png": "e29b3d74609bd980123dfc045a4e1f5a",
"index.html": "c76d593148d68bfae0d8319ef5ca5724",
"/": "c76d593148d68bfae0d8319ef5ca5724",
"main.dart.js": "f5952b6bf7bc2c31ce25bf216806bd6e",
"manifest.json": "c6f4dababf561109506053a2f75228ad",
"version.json": "cb7cf1089cc983a44d5908509c81e13a"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
