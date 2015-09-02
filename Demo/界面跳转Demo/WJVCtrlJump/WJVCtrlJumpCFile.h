
#import <Foundation/Foundation.h>

/**
 *  界面跳转的方式
 */
typedef NS_OPTIONS(NSUInteger, VCJumpOptions){

    WJVCtrlJumpWayAuto = 0 << 0,  //自动选择模式，有Nav时选择push，没有则Modal

    WJVCtrlJumpWayPush = 1 << 0,

    WJVCtrlJumpWayModal = 2 << 0,
};

/**
 *  类的信息的结构体
 */
struct WJViewControllerInfo {
    char *className;
    char *storyBoardName;
    char *storyBoardIdentify;
};
typedef struct WJViewControllerInfo WJViewControllerInfo;


/**
 *  构建类信息结构体（storyboard版）
 */
static inline WJViewControllerInfo WJCreatViewControllerInStoryBoard(char *className,char *storyBoardName, char *storyBoardIdentify){
    WJViewControllerInfo info;
    info.className = className;
    info.storyBoardIdentify = storyBoardIdentify;
    info.storyBoardName = storyBoardName;
    return info;
}

/**
 *  构建类信息结构体
 */
static inline WJViewControllerInfo WJCreatViewController(char *className){
    WJViewControllerInfo info;
    info.className = className;
    info.storyBoardIdentify = NULL;
    info.storyBoardName = NULL;
    return info;
}


