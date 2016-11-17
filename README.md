AssimpKit
=========
[![Build
Status](https://travis-ci.org/dmsurti/AssimpKit.svg?branch=master)](https://travis-ci.org/dmsurti/AssimpKit)
[![codecov](https://codecov.io/gh/dmsurti/AssimpKit/branch/master/graph/badge.svg)](https://codecov.io/gh/dmsurti/AssimpKit)

**AssimpKit** is a cross platform library (macOS, iOS) that coverts the files supported by [Assimp](https://github.com/assimp/assimp) to [Scene Kit](https://developer.apple.com/reference/scenekit) scenes.

### Why AssimpKit?

AssimpKit currently supports ***31 file formats*** that allows you to use these
files directly in SceneKit without having to convert these to any of the files
that SceneKit or Model IO supports thereby saving an extra step in your asset
pipeline.

### Features

AssimpKit supports loading:
* Geometry
* Materials (both color and texture)
* Lights
* Cameras and
* Skeletal animations.

### File formats supported by AssimpKit

Currently AssimpKit supports the following file formats:

***3d, 3ds, ac, b3d, bvh, cob, dae, dxf, hmp, ifc, irr, md2, md5mesh, md5anim, mdl,
m3sd, nff, obj, off, mesh.xml, ply, q3o, q3s, raw, smd, stl, wrl, xgl, zgl, fbx,
md3***

### Getting Started with AssimpKit

Table below lists the important classes in AssimpKit.

Class/Category        | Description         
----------------------| ----------------- 
SCNScene(AssimpImport)| The container for all SceneKit content, loaded with assimp.
SCNAssimpAnimation    | The container for all SceneKit skeletal animation content.

You can use the AssimpKit category defined on SCNScene to load scenes.

For more details on how to use AssimpKit to load scenes, including those with skeletal
animations, please refer to the API docs.

### [API Docs](https://dmsurti.github.io/AssimpKit/appledocs/html/index.html)

### AssimpKit License

AssimpKit's license is based on the modified, 3-clause BSD-License.

An informal summary is: do whatever you want, but include Assimp Kit's license text with your product - and don't sue me if the code doesn't work. For the legal details, see the LICENSE file.

### 3D Model Licenses

AssimpKit uses many model files placed under `assets` directory for testing purpose.

These model files are classified by owner:
* `assets/apple` --> asset files reused from Apple sample code projects, `Bananas` and `SceneKitAnimations`.
* `assets/of` --> The `astroBoy_walk.dae` file reused from the openframeworks example proejct, `examples/ios/assimpExample`.
* `assets/assimp` --> The model files reused from the `assimp/models`.

Please note that the copyright of these model files belongs to the respective owners and
AssimpKit utilizes these only for testing purpose.

Please refer to `licenses` directory for more information. 

So, if you re-package AssimpKit for use in a 'clean' OSS package, consider removing the model files which are proprietary.

### Author

@dmsurti

### Contributing Guide

To contribute to AssimpKit:

* Please open an issue describing the bug, enhancement or any other improvement.
* If valid, please supply the sample model file that can help demonstrate the issue.
* After discussion on the issue, you can submit a Pull Request by forking this project.