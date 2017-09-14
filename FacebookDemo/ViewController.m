//
//  ViewController.m
//  FacebookDemo
//
//  Created by ayy on 2017/9/13.
//  Copyright © 2017年 aoyy. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKShareKit/FBSDKShareKit.h>

@interface ViewController ()

@property (nonatomic, strong) UIImage *image;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"35" ofType:@"JPG"];
    NSData *imageData = [NSData dataWithContentsOfFile:filePath];
    self.image = [UIImage imageWithData:imageData];
    
}
- (IBAction)shareLink:(id)sender {
    
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    content.contentURL = [NSURL URLWithString:@"https://developers.facebook.com"];
    
    [FBSDKShareDialog showFromViewController:self
                                 withContent:content
                                    delegate:nil];
    

}
- (IBAction)sharePhoto:(id)sender {
    
    FBSDKSharePhoto *photo = [[FBSDKSharePhoto alloc] init];
    photo.image = self.image;
    photo.userGenerated = YES;
    FBSDKSharePhotoContent *content = [[FBSDKSharePhotoContent alloc] init];
    content.photos = @[photo,photo,photo,photo];
    
    [FBSDKShareDialog showFromViewController:self
                                 withContent:content
                                    delegate:nil];

}
- (IBAction)shareVedio:(id)sender {
    
    NSURL *videoURL = [NSURL URLWithString:@"assets-library://asset/asset.MOV?id=CD801364-BFBD-4539-94E4-B11C10181B68&ext=MOV"];
    
    FBSDKShareVideo *video = [[FBSDKShareVideo alloc] init];
    video.videoURL = videoURL;
    FBSDKShareVideoContent *content = [[FBSDKShareVideoContent alloc] init];
    content.video = video;
    
    [FBSDKShareDialog showFromViewController:self
                                 withContent:content
                                    delegate:nil];
    

}

- (IBAction)shareMedia:(id)sender {
    
    FBSDKSharePhoto *photo = [FBSDKSharePhoto photoWithImage:self.image userGenerated:YES];
    FBSDKShareVideo *video = [FBSDKShareVideo videoWithVideoURL:[NSURL URLWithString:@"assets-library://asset/asset.MOV?id=CD801364-BFBD-4539-94E4-B11C10181B68&ext=MOV"]];
    FBSDKShareMediaContent *content = [FBSDKShareMediaContent new];
    content.media = @[photo, video];
    
    FBSDKShareDialog *dialog = [[FBSDKShareDialog alloc] init];
    dialog.fromViewController = self;
    dialog.shareContent = content;
    dialog.mode = FBSDKShareDialogModeShareSheet;
    [dialog show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
