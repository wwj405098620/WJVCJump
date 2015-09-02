
#import "WJVCtrlJumpCFile.h"

@protocol WJVCtrlJumpProtocol <NSObject>
@optional

/**
 *  跳转方法
 *
 *  @param viewControllerInfo 跳转的类信息结构体{类名,类所在的storyboard名,类在storyboard中的identify}
 *  @param params             类实例的属性,以key:value字典格式存入（该类须有此key的属性，否则crash）
 *  @param options            跳转的配置,包括push modal等
 */
- (void)jumpToViewController:(WJViewControllerInfo)viewControllerInfo params:(NSDictionary *)params jumpOptions:(VCJumpOptions)options;


/**
 *  回到上一页
 */
- (void)goback;


/**
 *  回到栈底页
 */
- (void)gobackToRoot;

/**
 *  回到栈内的某一个界面
 */
-(void)gobackToVC:(NSString *)className;

@end
