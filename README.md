# dx_code 用于保存实验室样品管理系统开发过程中的测试代码
# 开发工具为 Embarcadero® Delphi 10.3.1，开发平台为WIN7_64/WIN10_64；数据库为MYSQL_5.7，数据库平台为UBUNTU_SERVER_16.04.6。
#
# 开发进度简述：

2019-06-19

小bug修正

2019-05-30

27号升级的代码丢了，需要在22号的基础上重新写

按照人员权限实现登录可视界面的功能已完成

计划下一步工作
完成“社会委托”模块设计，打印模板参照服务器上的009.fr3

2019-05-22
“打印标签”模块已经核对完成
“样品流转”模块已经核对完成

计划下一步工作
完成“社会委托”模块设计
完成按照人员权限实现登录可视界面的功能

2019-05-21
“样品流转”模块>>“接样>>留样>>处置”流程已经完成，待核对；

计划下步工作：
完成“样品流转”模块的“接样>>检验>>处置”流程；
完成按照用户权限登录的功能；

2019-05-18
“样品登记”模块>>“内部委托”>>“保存”功能完成，核对完毕；
“样品登记”模块>>“内部委托”>>“重置”功能完成，核对完毕；
“样品登记”模块>>“内部委托”>>“复制上条记录”功能暂时搁置，待形成统一意见后再开发；
“样品登记”模块>>“社会委托”>>“保存”功能暂时搁置，待形成统一意见后再开发；
“样品登记”模块>>“社会委托”>>“重置”功能完成，核对完毕；
“样品登记”模块>>“内部委托”>>“复制上条记录”功能暂时搁置，待形成统一意见后再开发；
“样品登记”模块>>“样品信息查询”子模块功能完成，核对完毕；

2019-05-17

实现了“登录窗体”>>“主窗体”；
实现了“主窗体”调用“样品登记”、“打印标签”、“样品流转”、“部门管理”、“用户管理”、“照片上传”；
“部门管理”、“用户管理”、“照片上传”模块已核查代码并备注，无特殊要求不做修改；
已使用内置加密函数对数据库用户表的用户密码字段进行加密；
数据库已建立“user_table”、“dept_table”、“quantify_table”,表结构经过验证，无特殊要求不做修改；
数据库已建立“quantify_table”、“sample_table”，表结构还在调整中；
编译环境配置为64位，编译产生的应用程序只能在WIN_64环境下运行；

计划下步工作：
完成“样品登记”模块相关功能
