//
//  PerfectAuthorityInfoVC.m
//  Driver
//
//  Created by 隋林栋 on 2019/4/17.
//Copyright © 2019 ping. All rights reserved.
//

#import "PerfectAuthorityInfoVC.h"
//image select
#import "BaseVC+BaseImageSelectVC.h"
//up image
#import "AliClient.h"
//vc
#import "AuthortiyExampleVC.h"
//request
#import "RequestApi+UserApi.h"

@interface PerfectAuthorityInfoVC ()
@property (nonatomic, strong) UILabel *labelIdentity;
@property (nonatomic, strong) UIImageView *ivIdentity;
@property (nonatomic, strong) UILabel *labelIdentityReverse;
@property (nonatomic, strong) UIImageView *ivIdentityReverse;
@property (nonatomic, strong) UILabel *labelDriver;
@property (nonatomic, strong) UIImageView *ivDriver;
@property (nonatomic, strong) UILabel *labelBusiness;
@property (nonatomic, strong) UIImageView *ivBusiness;
@property (nonatomic, strong) UILabel *labelHand;
@property (nonatomic, strong) UIImageView *ivHand;
@property (nonatomic, strong) UIImageView *ivSelected;
@property (nonatomic, strong) UIView *viewAll;
@property (nonatomic, strong) UIView *viewAuthorityExample;

@end

@implementation PerfectAuthorityInfoVC
#pragma mark 懒加载

- (UIView *)viewAuthorityExample{
    if (!_viewAuthorityExample) {
        _viewAuthorityExample = [UIView new];
        _viewAuthorityExample.backgroundColor = COLOR_BACKGROUND;
        _viewAuthorityExample.widthHeight = XY(SCREEN_WIDTH, W(30));
        
        {
            UILabel * labelTitle = [UILabel new];
            labelTitle.backgroundColor = [UIColor clearColor];
            labelTitle.textColor = COLOR_BLUE;
            labelTitle.fontNum = F(13);
            [labelTitle fitTitle:@"认证资料示例" variable:0];
            labelTitle.centerXCenterY = XY(_viewAuthorityExample.width/2.0+W(27)/2.0, _viewAuthorityExample.height/2.0);
            [_viewAuthorityExample addSubview:labelTitle];
            
            UIImageView *iv = [UIImageView new];
            iv.backgroundColor = [UIColor clearColor];
            iv.image = [UIImage imageNamed:@"authority_example_icon"];
            iv.widthHeight = XY(W(25), W(25));
            iv.rightCenterY = XY(labelTitle.left - W(2), labelTitle.centerY);
            [_viewAuthorityExample addSubview:iv];
        }
        [_viewAuthorityExample addTarget:self action:@selector(authorityExampleClick)];
        
    }
    return _viewAuthorityExample;
}
- (UIView *)viewAll{
    if (!_viewAll) {
        _viewAll = [UIView new];
        _viewAll.backgroundColor = [UIColor clearColor];
        _viewAll.width = SCREEN_WIDTH;
    }
    return _viewAll;
}
- (UILabel *)labelIdentity{
    if (_labelIdentity == nil) {
        _labelIdentity = [UILabel new];
        _labelIdentity.textColor = COLOR_333;
        _labelIdentity.font =  [UIFont systemFontOfSize:F(16) weight:UIFontWeightRegular];
    }
    return _labelIdentity;
}

- (UIImageView *)ivIdentity{
    if (_ivIdentity == nil) {
        _ivIdentity = [UIImageView new];
        _ivIdentity.image = [UIImage imageNamed:@"camera_身份证正"];
        _ivIdentity.widthHeight = XY(W(150),W(100));
        _ivIdentity.userInteractionEnabled = true;
        [_ivIdentity addTarget:self action:@selector(ivIdentityClick)];
    }
    return _ivIdentity;
}
- (UILabel *)labelBusiness{
    if (_labelBusiness == nil) {
        _labelBusiness = [UILabel new];
        _labelBusiness.textColor = COLOR_333;
        _labelBusiness.font =  [UIFont systemFontOfSize:F(16) weight:UIFontWeightRegular];
    }
    return _labelBusiness;
}

- (UIImageView *)ivBusiness{
    if (_ivBusiness == nil) {
        _ivBusiness = [UIImageView new];
        _ivBusiness.image = [UIImage imageNamed:@"camera_从业资格证"];
        _ivBusiness.widthHeight = XY(W(150),W(100));
        _ivBusiness.userInteractionEnabled = true;
        [_ivBusiness addTarget:self action:@selector(ivBusinessClick)];
    }
    return _ivBusiness;
}

- (UILabel *)labelIdentityReverse{
    if (_labelIdentityReverse == nil) {
        _labelIdentityReverse = [UILabel new];
        _labelIdentityReverse.textColor = COLOR_333;
        _labelIdentityReverse.font =  [UIFont systemFontOfSize:F(16) weight:UIFontWeightRegular];
    }
    return _labelIdentityReverse;
}

- (UILabel *)labelHand{
    if (_labelHand == nil) {
        _labelHand = [UILabel new];
        _labelHand.textColor = COLOR_333;
        _labelHand.font =  [UIFont systemFontOfSize:F(16) weight:UIFontWeightRegular];
    }
    return _labelHand;
}
- (UIImageView *)ivIdentityReverse{
    if (_ivIdentityReverse == nil) {
        _ivIdentityReverse = [UIImageView new];
        _ivIdentityReverse.image = [UIImage imageNamed:@"camera_身份证反"];
        _ivIdentityReverse.widthHeight = XY(W(150),W(100));
        _ivIdentityReverse.userInteractionEnabled = true;
        [_ivIdentityReverse addTarget:self action:@selector(ivIdentityReverseClick)];
    }
    return _ivIdentityReverse;
}
- (UIImageView *)ivHand{
    if (_ivHand == nil) {
        _ivHand = [UIImageView new];
        _ivHand.image = [UIImage imageNamed:@"camera_手持身份证"];
        _ivHand.widthHeight = XY(W(150),W(100));
        _ivHand.userInteractionEnabled = true;
        [_ivHand addTarget:self action:@selector(ivHandClick)];
    }
    return _ivHand;
}
- (UILabel *)labelDriver{
    if (_labelDriver == nil) {
        _labelDriver = [UILabel new];
        _labelDriver.textColor = COLOR_333;
        _labelDriver.font =  [UIFont systemFontOfSize:F(16) weight:UIFontWeightRegular];
    }
    return _labelDriver;
}
- (UIImageView *)ivDriver{
    if (_ivDriver == nil) {
        _ivDriver = [UIImageView new];
        _ivDriver.image = [UIImage imageNamed:@"camera_驾驶证"];
        _ivDriver.widthHeight = XY(W(150),W(100));
        _ivDriver.userInteractionEnabled = true;
        [_ivDriver addTarget:self action:@selector(ivDriverReverseClick)];
    }
    return _ivDriver;
}
#pragma mark view did load
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加导航栏
    [self addNav];
    self.viewBG.backgroundColor = [UIColor whiteColor];
    //config view
    [self configView];
    //request
    [self requestInfo];
    
//    [self.ivHand addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
}
//- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSString*, id> *)change context:(nullable void *)context{
//    NSLog(@"%@",keyPath);
//    NSLog(@"%@",object);
//}
- (void)configView{
    //添加subView
    [self.viewAll addSubview:self.viewAuthorityExample];
    [self.viewAll addSubview:self.labelIdentity];
    [self.viewAll addSubview:self.ivIdentity];
    [self.viewAll addSubview:self.labelIdentityReverse];
    [self.viewAll addSubview:self.ivIdentityReverse];
    [self.viewAll addSubview:self.labelDriver];
    [self.viewAll addSubview:self.ivDriver];
    [self.viewAll addSubview:self.labelHand];
    [self.viewAll addSubview:self.ivHand];
    [self.viewAll addSubview:self.labelBusiness];
    [self.viewAll addSubview:self.ivBusiness];
    
    //刷新view
    {
        self.viewAuthorityExample.leftTop = XY(0, 0);
    }
    {
        self.ivIdentity.rightTop = XY(SCREEN_WIDTH - W(15),W(25)+self.viewAuthorityExample.height);
        
        [self.labelIdentity fitTitle:@"身份证人像面" variable:0];
        self.labelIdentity.leftCenterY = XY(W(15),self.ivIdentity.centerY);
    }
    
    {
        self.ivIdentityReverse.rightTop = XY(SCREEN_WIDTH - W(15),[self.viewAll addLineFrame:CGRectMake(W(15), self.ivIdentity.bottom + W(25), SCREEN_WIDTH - W(30), 1)]+W(25));
        
        [self.labelIdentityReverse fitTitle:@"身份证国徽面" variable:0];
        self.labelIdentityReverse.leftCenterY = XY(W(15),self.ivIdentityReverse.centerY);
    }
    
    {
        self.ivDriver.rightTop = XY(SCREEN_WIDTH - W(15),[self.viewAll addLineFrame:CGRectMake(W(15), self.ivIdentityReverse.bottom + W(25), SCREEN_WIDTH - W(30), 1)]+W(25));
        
        [self.labelDriver fitTitle:@"驾驶证" variable:0];
        self.labelDriver.leftCenterY = XY(W(15),self.ivDriver.centerY);
        [self.viewAll addLineFrame:CGRectMake(W(15), self.ivDriver.bottom + W(25), SCREEN_WIDTH - W(30), 1)];
    }
    
    
    {
        self.ivHand.rightTop = XY(SCREEN_WIDTH - W(15),[self.viewAll addLineFrame:CGRectMake(W(15), self.ivDriver.bottom + W(25), SCREEN_WIDTH - W(30), 1)]+W(25));
        
        [self.labelHand fitTitle:@"手持身份证" variable:0];
        self.labelHand.leftCenterY = XY(W(15),self.ivHand.centerY);
        
        [self.viewAll addLineFrame:CGRectMake(W(15), self.ivHand.bottom + W(25), SCREEN_WIDTH - W(30), 1)];
    }
    {
        self.ivBusiness.rightTop = XY(SCREEN_WIDTH - W(15),[self.viewAll addLineFrame:CGRectMake(W(15), self.ivHand.bottom + W(25), SCREEN_WIDTH - W(30), 1)]+W(25));
        
        [self.labelBusiness fitTitle:@"从业资格证" variable:0];
        self.labelBusiness.leftCenterY = XY(W(15),self.ivBusiness.centerY);
        
        [self.viewAll addLineFrame:CGRectMake(W(15), self.ivBusiness.bottom + W(25), SCREEN_WIDTH - W(30), 1)];
    }
    self.viewAll.height  = self.ivBusiness.bottom + W(40);
    
    self.tableView.tableHeaderView = self.viewAll;
}
#pragma mark 添加导航栏
- (void)addNav{
    WEAKSELF
    [self.view addSubview:[BaseNavView initNavBackTitle:@"司机认证" rightTitle:@"提交" rightBlock:^{
        [weakSelf requestSubmit];
    }]];
}

#pragma mark click
- (void)ivIdentityClick{
    self.ivSelected = self.ivIdentity;
    [self showImageVC:1];
    
}

- (void)ivHandClick{
    self.ivSelected = self.ivHand;
    [self showImageVC:1];
    
}
- (void)ivIdentityReverseClick{
    self.ivSelected = self.ivIdentityReverse;
    [self showImageVC:1];
    
}
- (void)ivDriverReverseClick{
    self.ivSelected = self.ivDriver;
    [self showImageVC:1];
    
}
- (void)ivBusinessClick{
    self.ivSelected = self.ivBusiness;
    [self showImageVC:1];
    
}
//选择图片
- (void)imageSelect:(BaseImage *)image{
    if (self.ivSelected == self.ivIdentity) {
        self.ivIdentity.image = image;
    }else if(self.ivSelected == self.ivIdentityReverse){
        self.ivIdentityReverse.image = image;
    }else if(self.ivSelected == self.ivDriver){
        self.ivDriver.image = image;
    }else if(self.ivSelected == self.ivHand){
        self.ivHand.image = image;
    }else if(self.ivSelected == self.ivBusiness){
        self.ivBusiness.image = image;
    }
    [AliClient sharedInstance].imageType = ENUM_UP_IMAGE_TYPE_USER_AUTHORITY;
    [[AliClient sharedInstance]updateImageAry:@[image] storageSuccess:^{
        
    } upSuccess:^{
        
    } fail:^{
        
    }];
}
- (void)authorityExampleClick{
    AuthortiyExampleVC * vc = [AuthortiyExampleVC new];
    vc.aryDatas =@[^(){
        ModelBaseData * model = [ModelBaseData new];
        model.string = @"身份证人像面示例";
        model.imageName = @"authority_example_idcard";
        return model;
    }(),^(){
        ModelBaseData * model = [ModelBaseData new];
        model.string = @"身份证国徽面示例";
        model.imageName = @"authority_example_idcardBack";
        return model;
    }(),^(){
        ModelBaseData * model = [ModelBaseData new];
        model.string = @"驾驶证示例";
        model.imageName = @"authority_example_driverlicense";
        return model;
    }(),^(){
        ModelBaseData * model = [ModelBaseData new];
        model.string = @"手持身份证示例";
        model.imageName = @"authority_example_idcardHand";
        return model;
    }(),^(){
        ModelBaseData * model = [ModelBaseData new];
        model.string = @"从业资格证示例";
        model.imageName = @"authority_example_business";
        return model;
    }()].mutableCopy;
    [GB_Nav pushViewController:vc animated:true];
}
#pragma mark request
- (void)requestSubmit{
    if (!isStr([BaseImage fetchUrl:self.ivIdentity.image] )) {
        [GlobalMethod showAlert:@"请添加身份证人像面"];
        return;
    }
    if (!isStr([BaseImage fetchUrl:self.ivIdentityReverse.image] )) {
        [GlobalMethod showAlert:@"请添加身份证国徽面"];
        return;
    }
    if (!isStr([BaseImage fetchUrl:self.ivDriver.image] )) {
        [GlobalMethod showAlert:@"请添加驾驶证"];
        return;
    }
    if (!isStr([BaseImage fetchUrl:self.ivHand.image] )) {
        [GlobalMethod showAlert:@"请添加手持身份证"];
        return;
    }
    
    [RequestApi requestSubmitAuthorityInfoWithDriverlicenseurl:[BaseImage fetchUrl:self.ivDriver.image]
                                                idCardFrontUrl:[BaseImage fetchUrl:self.ivIdentity.image]
                                                 idCardBackUrl:[BaseImage fetchUrl:self.ivIdentityReverse.image]
                                               idCardHandelUrl:[BaseImage fetchUrl:self.ivHand.image]
                                                certificateUrl:[BaseImage fetchUrl:self.ivBusiness.image]
                                                      delegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
                                                          [RequestApi requestUserInfoWithDelegate:self success:^(NSDictionary * _Nonnull response, id  _Nonnull mark) {
                                                              [GlobalData sharedInstance].GB_UserModel = [ModelBaseInfo modelObjectWithDictionary:response];
                                                              BOOL isQuantity  =  [GlobalData sharedInstance].GB_UserModel.isIdentity == 1&&  [GlobalData sharedInstance].GB_UserModel.isDriver == 1;
                                                              
                                                              NSMutableArray * ary = [NSMutableArray array];
                                                              for (UIViewController * vc in GB_Nav.viewControllers) {
                                                                  if ([vc isKindOfClass:NSClassFromString(@"LoginViewController")]||[vc isKindOfClass:NSClassFromString(@"DriverDetailVC")]) {
                                                                      [GlobalMethod showAlert:@"提交成功"];
                                                                      [ary addObject:vc];
                                                                      [ary addObject:[NSClassFromString(isQuantity?@"AuthorityReVerifyingVC":@"AuthorityVerifyingVC") new]];
                                                                      [GB_Nav setViewControllers:ary animated:true];
                                                                      return;
                                                                  }else{
                                                                      [ary addObject:vc];
                                                                  }
                                                              }
                                                              [GlobalMethod clearUserInfo];
                                                              [GlobalMethod createRootNav];
                                                          } failure:^(NSString * _Nonnull errorStr, id  _Nonnull mark) {
                                                              
                                                          }];
                                                      } failure:^(NSString * _Nonnull errorStr, id  _Nonnull mark) {
                                                          
                                                      }];
}

- (void)requestInfo{
    if (!self.userId) {
        return;
    }
    void (^blockSuccess)(NSDictionary * _Nonnull response, id  _Nonnull mark) = ^(NSDictionary * _Nonnull response, id  _Nonnull mark){
        WEAKSELF
        if (isStr([response stringValueForKey:@"idCardFrontUrl"])) {
            [self.ivIdentity sd_setImageWithURL:[NSURL URLWithString:[response stringValueForKey:@"idCardFrontUrl"]] placeholderImage:self.ivIdentity.image completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if (error == nil && image) {
                    weakSelf.ivIdentity.image = [BaseImage imageWithImage:image url:imageURL];
                }
            }];
        }
        if(isStr([response stringValueForKey:@"idCardBackUrl"])){
            [self.ivIdentityReverse sd_setImageWithURL:[NSURL URLWithString:[response stringValueForKey:@"idCardBackUrl"]] placeholderImage:self.ivIdentityReverse.image completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if (error == nil && image) {
                    weakSelf.ivIdentityReverse.image = [BaseImage imageWithImage:image url:imageURL];
                }
            }];
        }
        if(isStr([response stringValueForKey:@"driverLicenseUrl"])){
            [self.ivDriver sd_setImageWithURL:[NSURL URLWithString:[response stringValueForKey:@"driverLicenseUrl"]] placeholderImage:self.ivDriver.image completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if (error == nil && image) {
                    weakSelf.ivDriver.image = [BaseImage imageWithImage:image url:imageURL];
                }
            }];
        }
        if(isStr([response stringValueForKey:@"idCardHandelUrl"])){
            [self.ivHand sd_setImageWithURL:[NSURL URLWithString:[response stringValueForKey:@"idCardHandelUrl"]] placeholderImage:self.ivHand.image completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if (error == nil && image) {
                    weakSelf.ivHand.image = [BaseImage imageWithImage:image url:imageURL];
                }
            }];
        }
        if(isStr([response stringValueForKey:@"certificateUrl"])){
            [self.ivBusiness sd_setImageWithURL:[NSURL URLWithString:[response stringValueForKey:@"certificateUrl"]] placeholderImage:self.ivBusiness.image completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if (error == nil && image) {
                    weakSelf.ivBusiness.image = [BaseImage imageWithImage:image url:imageURL];
                }
            }];
        }
    };
    [RequestApi requestUserAuthorityInfoWithDelegate:self success:blockSuccess failure:^(NSString * _Nonnull errorStr, id  _Nonnull mark) {
        
    }];
    
}
@end
