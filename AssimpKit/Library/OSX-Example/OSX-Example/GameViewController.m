
/*
---------------------------------------------------------------------------
Assimp to Scene Kit Library (AssimpKit)
---------------------------------------------------------------------------
Copyright (c) 2016, Deepak Surti, Ison Apps, AssimpKit team
All rights reserved.
Redistribution and use of this software in source and binary forms,
with or without modification, are permitted provided that the following
conditions are met:
* Redistributions of source code must retain the above
  copyright notice, this list of conditions and the
  following disclaimer.
* Redistributions in binary form must reproduce the above
  copyright notice, this list of conditions and the
  following disclaimer in the documentation and/or other
  materials provided with the distribution.
* Neither the name of the AssimpKit team, nor the names of its
  contributors may be used to endorse or promote products
  derived from this software without specific prior
  written permission of the AssimpKit team.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
---------------------------------------------------------------------------
*/

#import "GameViewController.h"
#import <AssimpKit/PostProcessingFlags.h>
#import <AssimpKit/SCNScene+AssimpImport.h>

@implementation GameViewController

- (void)awakeFromNib
{
    self.gameView.allowsCameraControl = YES;

    // show statistics such as fps and timing information
    self.gameView.showsStatistics = YES;

    // configure the view
    self.gameView.backgroundColor = [NSColor whiteColor];

    self.gameView.playing = YES;
}

- (IBAction)viewModel:(id)sender
{
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setAllowedFileTypes:[SCNAssimpScene allowedFileExtensions]];
    [panel setCanChooseFiles:YES];
    [panel setCanChooseDirectories:NO];
    [panel setAllowsMultipleSelection:NO];
    NSInteger clicked = [panel runModal];

    if (clicked == NSFileHandlingPanelOKButton)
    {
        SCNAssimpScene *scene = [SCNScene
            assimpSceneWithURL:[NSURL URLWithString:panel.URL.absoluteString]
              postProcessFlags:AssimpKit_Process_FlipUVs |
                               AssimpKit_Process_Triangulate];
        self.gameView.scene = scene;
    }
}
- (IBAction)addAnimation:(id)sender
{
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setAllowedFileTypes:[SCNAssimpScene allowedFileExtensions]];
    [panel setCanChooseFiles:YES];
    [panel setCanChooseDirectories:NO];
    [panel setAllowsMultipleSelection:NO];
    NSInteger clicked = [panel runModal];

    if (clicked == NSFileHandlingPanelOKButton)
    {
        SCNAssimpScene *animScene = [SCNScene
            assimpSceneWithURL:[NSURL URLWithString:panel.URL.absoluteString]
              postProcessFlags:AssimpKit_Process_FlipUVs |
                               AssimpKit_Process_Triangulate];
        SCNAssimpScene *scene = (SCNAssimpScene *)self.gameView.scene;
        if (scene == nil) {
            scene = animScene;
            self.gameView.scene = scene;
        }
        NSArray *animationKeys = animScene.animationKeys;
        // If multiple animations exist, load the first animation
        if (animationKeys.count > 0)
        {
            SCNAssimpAnimation *animation =
                [animScene animationForKey:[animationKeys objectAtIndex:0]];
            [scene addAnimation:animation];
        }
    }
}

@end
