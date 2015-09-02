
#import "UIViewController+VCtrlJump.h"

@implementation UIViewController (VCtrlJump)


- (void)jumpToViewController:(WJViewControllerInfo)viewControllerInfo params:(NSDictionary *)params jumpOptions:(VCJumpOptions)options
{
    UIViewController *controller = [self initialNextViewController:viewControllerInfo params:params];
    if (options&WJVCtrlJumpWayModal) {
        [self presentViewController:controller animated:YES completion:NULL];
    }
    else if (options&WJVCtrlJumpWayPush) {
        [self.navigationController pushViewController:controller animated:YES];
    }else
    {
        if (self.navigationController) {
            [self.navigationController pushViewController:controller animated:YES];
        }else{
            [self presentViewController:controller animated:YES completion:NULL];
        }
    }
    
}

//初始化VCtrl实例
- (UIViewController *)initialNextViewController:(WJViewControllerInfo)viewControllerInfo params:(NSDictionary *)params
{
    NSString *className = [NSString stringWithFormat:@"%s",viewControllerInfo.className];
     UIViewController *controller;
    if (viewControllerInfo.storyBoardIdentify) {
        NSString *storyBoardName = [NSString stringWithFormat:@"%s",viewControllerInfo.storyBoardName];
        NSString *storyBoardIdentify = [NSString stringWithFormat:@"%s",viewControllerInfo.storyBoardIdentify];
        UIStoryboard *board = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
        controller = [board instantiateViewControllerWithIdentifier:storyBoardIdentify];
    }
    else
        controller = [NSClassFromString(className) new];
    NSEnumerator *enumerator = [params keyEnumerator];
    id key;
    while ((key = [enumerator nextObject])) {
        [controller setValue:params[key] forKeyPath:key];
    }
    return controller;
}

-(void)goback
{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)gobackToRoot
{
    if (self.navigationController) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}
-(void)gobackToVC:(NSString *)className
{
    for (UIViewController *ctrl in self.navigationController.viewControllers) {
        if ([ctrl isKindOfClass:NSClassFromString(className)]) {
            [self.navigationController popToViewController:ctrl animated:NO];
        }
    }
}


#pragma mark Property

@end
