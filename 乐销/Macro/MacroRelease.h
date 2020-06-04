//
//  MacroRelease.h
//  中车运
//
//  Created by 隋林栋 on 2017/6/16.
//  Copyright © 2017年 ping. All rights reserved.
//

#ifndef MacroRelease_h
#define MacroRelease_h

//请求URL
#if DEBUG
#define URL_HEAD  @"http://112.253.1.72:10201"
#define URL_IMAGE @"http://112.253.1.72:10299"//image
#define URL_SHARE @"http://112.253.1.72:10201"
//#define URL_HEAD  @"https://api.zhongcheyun.cn"//外网
//#define URL_IMAGE @"http://img.zhongcheyun.cn"//阿里云
//#define URL_SHARE @"https://www.zhongcheyun.cn"//
#else
#define URL_HEAD  @"https://api.zhongcheyun.cn"//外网
#define URL_IMAGE @"http://img.zhongcheyun.cn"//阿里云
#define URL_SHARE @"https://www.zhongcheyun.cn"//

#endif

#if DEBUG
//#define SLD_TEST //sld_test
//#define SLD_TRACK //track test
#endif

//交通部
#define TRANSPORT_AGENCY_APP_ID @"tlanx.midCarrierTransport.dirver"
#define TRANSPORT_AGENCY_APP_SEC @"afa843f62b9a42d2b41d91e0d9df41085984f8dcbb904bd6a3b1a2a8340be303"
#define TRANSPORT_AGENCY_CODE @"37100820"
#define TRANSPORT_AGENCY_ENV  @"release"

//#if DEBUG
//#define TRANSPORT_AGENCY_ENV  @"debug"
//#else
//#define TRANSPORT_AGENCY_ENV  @"release"
//#endif



//前缀
#define PREFIX_SCHEDULE @"zcy_s:"

//阿里云文件地址
#define ENDPOINT @"http://oss-cn-beijing.aliyuncs.com"
#define ENDPOINT_VIDEO @"http://oss-cn-beijing.aliyuncs.com"

#define IMAGEURL_HEAD @"http://img.zhongcheyun.cn"
//微信 appid
#define WXAPPID @"wx2902420d2d2b957d"
#define WXAPPLINK  @"https://www.zhongcheyun.cn/driver/"
#define WECHAT_UPDATE


//高德地图
#if DEBUG

#define MAPID @"ec5edb0fb3d9cc4d4e64a72ba62b1dfe"

#else
#define MAPID @"d7e24a6e856fdf6f255910fe2814d4cb"
#endif

//闪登
#define FLASH_ID @"h9HQTEdK"
#define FLASH_KEY @"1sNSijQW"



#endif /* MacroRelease_h */
