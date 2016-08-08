USE [master]
GO
/****** Object:  Database [HireMe]    Script Date: 08/08/2016 15:31:11 ******/
CREATE DATABASE [HireMe] ON  PRIMARY 
( NAME = N'HireMe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SCDTICPC20\MSSQL\DATA\HireMe.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HireMe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SCDTICPC20\MSSQL\DATA\HireMe_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HireMe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HireMe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HireMe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HireMe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HireMe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HireMe] SET ARITHABORT OFF 
GO
ALTER DATABASE [HireMe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HireMe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HireMe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HireMe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HireMe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HireMe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HireMe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HireMe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HireMe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HireMe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HireMe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HireMe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HireMe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HireMe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HireMe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HireMe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HireMe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HireMe] SET RECOVERY FULL 
GO
ALTER DATABASE [HireMe] SET  MULTI_USER 
GO
ALTER DATABASE [HireMe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HireMe] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HireMe', N'ON'
GO
USE [HireMe]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 08/08/2016 15:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HistoryPost]    Script Date: 08/08/2016 15:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryPost](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NULL,
	[IdPostJob] [int] NULL,
 CONSTRAINT [PK_HistoryPost] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PostJob]    Script Date: 08/08/2016 15:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostJob](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Location] [nvarchar](200) NULL,
	[Position] [nvarchar](200) NULL,
	[Company] [nvarchar](max) NULL,
	[LogoType] [nvarchar](max) NULL,
	[Active] [int] NULL,
	[DatePublish] [datetime] NULL,
	[Token] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[EmailReference] [nvarchar](max) NULL,
	[DueDate] [datetime] NULL,
	[IdTypeJob] [int] NULL,
	[IdCategory] [int] NULL,
	[URL] [nvarchar](max) NULL,
 CONSTRAINT [PK_PostJob] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TypeJob]    Script Date: 08/08/2016 15:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeJob](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_TypeJob] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TypeUser]    Script Date: 08/08/2016 15:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_TypeUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 08/08/2016 15:31:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Token] [nvarchar](100) NULL,
	[Active] [int] NULL,
	[IdTypeUser] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Design')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Software')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Network')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[HistoryPost] ON 

INSERT [dbo].[HistoryPost] ([Id], [IdUser], [IdPostJob]) VALUES (1, 4, 3)
INSERT [dbo].[HistoryPost] ([Id], [IdUser], [IdPostJob]) VALUES (2, 1, 4)
INSERT [dbo].[HistoryPost] ([Id], [IdUser], [IdPostJob]) VALUES (3, 1, 5)
INSERT [dbo].[HistoryPost] ([Id], [IdUser], [IdPostJob]) VALUES (1003, 1005, 7)
SET IDENTITY_INSERT [dbo].[HistoryPost] OFF
SET IDENTITY_INSERT [dbo].[PostJob] ON 

INSERT [dbo].[PostJob] ([Id], [Location], [Position], [Company], [LogoType], [Active], [DatePublish], [Token], [Description], [EmailReference], [DueDate], [IdTypeJob], [IdCategory], [URL]) VALUES (1, N'Remote Developer', N'Senior FrontEnd Developer', N'Envision', N'bfeb002285b460c8fb6829baeee8a413.png', 1, CAST(N'2016-08-08 00:00:00.000' AS DateTime), N'A389B58145@TS01$CD', N'About Envision:
Envision is a FinTech start-up company based at Level 39 Canary Wharf London, europe’s largest technology accelerator for FinTech. Envision is also a member of the Innovate Finance and very actively engaged with the London’s fast paced FinTech community. At Envision we believe in a future free from the complexity of the payments eco-system and 100% peace of mind guaranteed for our customers from the risk of growing online fraud.

Envision is building a digital payments platform that connects smaller and medium-sized businesses in Europe and SMEs from the emerging markets to their consumers in the developed economies. Our platform is a simple, secure and affordable way for the businesses to integrate their online stores, mobile apps to receive payments from all major credit/ debit cards. We make integration very simple with clear documentation and clean APIs so any business can integrate their website or apps to our platform without the help of any skilled developer. We also offer secure payment transactions and 100% chargeback guarantees giving our customers complete peace of mind to grow their business.

Growth of global eCommerce requires an affordable, easy to integrate, secure and open to all payments platform, especially in emerging markets. We believe that people are inherently innovative and every community has something unique to offer the world given the opportunity and the platform for launch and growth. Envision’s goal is to connect millions of businesses and entrepreneurs with innovative products from the emerging markets to their international consumers and growth of cross-border transactions that still suffers from the risk of online fraud. We want to contribute to the world in meaningful ways in connecting and empowering entrepreneurs from communities that nobody has served before while also building the foundation of a very successful and forward looking business.

The roles:
We are building the initial development team, so you will have opportunity to influence the development from the beginning, and not have to try and maintain old or deprecated code. We are looking for:

1 Senior Frontend Engineer.
1 Frontend Engineer.
2 Senior Backend Engineers (1 Java/Spring, 1 Golang).
1 Backend Engineer. (Java/Spring)
1 UX Designer
Frontend Engineer and Senior Frontend Engineer Requirements:
At least 2 years experience as a Front End Software Engineer. (5 for senior)
Experience working with HTML5, CSS3, Less.
Strong knowledge of Javascript ES6, JQuery, JSX, React and Webpack.
Comfortable with Mac OS X and/or Linux (Debian/Ubuntu).
Knowledge of TDD principles, and JS testing frameworks (Karma, Protractor, Selenium,…)
Excellent communicator. You can chat, skype, email efficiently.
Good at explaining and mentoring less experienced team members.
Backend Engineer and Senior Backend Engineer Requirements:
At least 2 years experience as a Back End Software Engineer. (5 for senior)
Experience working with Java 8 and/or Golang.
Strong knowledge of Maven, Spring Boot, Kafka, Zookeeper or RabbitMQ.
Strong knowledge of OAuth2, Design Patterns, REST apis.
Working knowledge of ElasticSearch, Elastalert, Graphana, Kibana.
Experience with SQL and noSQL databases.
Comfortable with Mac OS X and/or Linux (Debian/Ubuntu).
Knowledge of TDD principles, and testing frameworks (JUnit, Mockito, Cucumber).
Excellent communicator. You can chat, skype, email efficiently.
Good at explaining and mentoring less experienced team members.
Knowledge of Flyway or similar.
UX Designer Requirements:
At least 2 years experience as a UX Designer for software, web applications and mobile.
Exceptional design skills, production value and attention to detail.
Strong working knowledge of design tools like Photoshop, Illustrator, InDesign, …
Ability to create wireframes as well as visual design comps.
Extras:
Familiarity with Git, Jira, Bitbucket, Bamboo or VSTS desired.
Previous experience working remotely.
Understanding of Agile methodologies (Scrum // Kanban).
A familiarity with Payment Systems and PCI-DSS requirements would be extremely advantageous.
Personal Skills:

Individual with a passion and enthusiasm to take on bigger challenges and stretching goals.
Success mindset.
Proactive and creative self-starter.
Problem solver with positive mental and learning attitude.
Team player with strong interpersonal, communication skills.
Can work in small team with a vision to grow.
We are always looking for people who are keen to make a difference and put their knowledge and expertise to practical test. We encourage taking calculated risks and learn quickly and refine our processes for the benefit of our customers.

Envision is not only about profits. Our ambition is to be a socially responsible company contributing to the local children charities and support orphan children around the world educating them on self reliance, practical life skills and not only to survive but thrive in a world full of opportunities and abundance.

We thank you in advance for your interest!', N'prueba@hotmail.com', CAST(N'2016-08-09 00:00:00.000' AS DateTime), 1, 1, N'http://envisionworld.co/')
INSERT [dbo].[PostJob] ([Id], [Location], [Position], [Company], [LogoType], [Active], [DatePublish], [Token], [Description], [EmailReference], [DueDate], [IdTypeJob], [IdCategory], [URL]) VALUES (2, N'Remote Developer', N'Java Data Tier Developer', N'In The Chat Communications', N'1f967b2e97ccb09a9c0964356ad69dbb.png', 1, CAST(N'2016-08-08 10:00:00.000' AS DateTime), N'B57@SWTPA459715', N'Develop In the Chat''s data tier. This is a message-passing network of Java daemons that acquires large volumes of data from Twitter, Facebook, Twilio, chat clients and other sources. The daemons classify the incoming messages and route them to call centre agents. See ''About the Company'' for more on the application. Classification uses a variety of techniques, most prominently NLP.', N'prueba@hotmail.com', CAST(N'2016-08-09 00:00:00.000' AS DateTime), 1, 1, N'http://inthechat.com/')
INSERT [dbo].[PostJob] ([Id], [Location], [Position], [Company], [LogoType], [Active], [DatePublish], [Token], [Description], [EmailReference], [DueDate], [IdTypeJob], [IdCategory], [URL]) VALUES (3, N'Remote Dev.', N'Fullstack Javascript Dev', N'Social News Desk', N'9ee90f16660f6312ac491711ab326c3c.png', 1, CAST(N'2016-08-08 10:42:21.383' AS DateTime), N'0EEDADEDC101FAC0720B33FFD040142A', N'We''re looking for a person with the right blend of experience in both front-end and back-end development, a love for coding and learning, and the ability to work in a fully-remote environment.  A high-energy person and strong communicator who can join an expert team and work with limited direction.  ', N'jurav8@gmail.com', CAST(N'2016-09-07 10:42:21.613' AS DateTime), 1, 2, N'Promesecal.gob.do')
INSERT [dbo].[PostJob] ([Id], [Location], [Position], [Company], [LogoType], [Active], [DatePublish], [Token], [Description], [EmailReference], [DueDate], [IdTypeJob], [IdCategory], [URL]) VALUES (4, N'Remote Dev.', N'Lisp Software Engineer', N'Crossover', N'03ecd71805666dc2c6553fefd3708ef6.jpg', 1, CAST(N'2016-08-08 10:51:29.433' AS DateTime), N'CD246DCABB4FA2F14E36B8487B74F112', N'This position offers an excellent opportunity to be involved in development of industry-leading real time expert system and related products. The work involves design and development of new functionality and requires a hands-on product development approach. There is a lot of freedom and choice to develop solutions to interesting problems and build new features.', N'NPI@gmail.com', CAST(N'2016-09-07 10:51:29.633' AS DateTime), 1, 2, N'Crossover.com')
INSERT [dbo].[PostJob] ([Id], [Location], [Position], [Company], [LogoType], [Active], [DatePublish], [Token], [Description], [EmailReference], [DueDate], [IdTypeJob], [IdCategory], [URL]) VALUES (5, N'Remote Dev.', N'Mobile Apps Developer Android', N'Crossover GG', N'03ecd71805666dc2c6553fefd3708ef6.jpg', 1, CAST(N'2016-08-08 10:51:29.000' AS DateTime), N'FE96FF2900291CF0366208E7CCE43467', N'Ready to make $30,000 USD while working for a fortune 500 company from the comfort of your home? Eager to join a network of the most talented remote workers in the world? If so, this role is for you. Work for Crossover, and youll earn the most competitive wages on the market, collaborate with the most skilled teams in your field, and work for the most elite companies in the world. Sound too good to be true? Take a closer look...', N'yolo@gmail.com', CAST(N'2016-09-07 10:51:29.000' AS DateTime), 3, 3, N'Crossover.com')
INSERT [dbo].[PostJob] ([Id], [Location], [Position], [Company], [LogoType], [Active], [DatePublish], [Token], [Description], [EmailReference], [DueDate], [IdTypeJob], [IdCategory], [URL]) VALUES (6, N'Remote Dev.', N'Senior UI/JavaScript Frontend Engineer', N'Sticker-Mule', N'306a295ac0100cc12d11da2b13691eb0.png', 1, CAST(N'2016-08-08 15:06:14.150' AS DateTime), N'18624BD776574B0727586F88C58A5737', N'ABOUT US
At Close.io we’re building the sales communication platform of the future. We’ve built a next-generation CRM that eliminates manual data entry and helps sales teams close more deals. We are hiring engineers to help us unify the world''s sales calls and emails into one beautiful workflow.

Our app’s front-end is a single-page HTML5/JavaScript web app written with Backbone.js, jQuery, RequireJS, Handlebars, QUnit, Grunt, etc. It’s built entirely on top of our public REST API and targets only modern browsers. Our UI updates in near real-time and is written in LESS/CSS atop Bootstrap.

We ❤ open source – using 40+ frontend libraries/plugins with contributions to many of them.

ABOUT YOU
We''re looking for experienced full-time developers to join our core team who have a strong understanding of web technologies and want to help design, implement, and launch major user-facing features.

YOU SHOULD...
Have 3+ years experience building modern front-end applications in JavaScript, HTML5, and CSS
Have great product sense and be able to think through user experience issues before diving into the code
Write maintainable, testable, and performant JavaScript
Have a love for great UI
Enjoy debugging all aspects of the front-end app including memory leaks and quirky CSS across browsers
Have experience implementing real-time (e.g. websockets, polling, etc.) web apps
Have significant experience with REST APIs and thoroughly understand HTTP requests

BONUS POINTS IF YOU...
Have an eye for design and experience with Photoshop, Sketch, or similar
Have contributed open source code (core or plugins) for a popular frontend framework such as Backbone, Angular, or React

WHY WORK WITH US?
Work remotely from anywhere in the world! Just be willing to do a bit of traveling every year for some face-to-face time with the whole team :)
Help build a truly successful SaaS company with a stellar team where you can have a huge impact.
Above market salary and benefits
Fun company culture that embraces a healthy work/life balance

To apply: Apply here: https://jobs.lever.co/close.io/10a1e32b-1a59-48dc-b8f4-e6f0dfae4e20?lever-source=WWR', N'GGWP@gmail.com', CAST(N'2016-09-07 15:06:14.390' AS DateTime), 1, 2, N' https://jobs.lever.co/close.io/10a1e32b-1a59-48dc-b8f4-e6f0dfae4e20?lever-source=WWR')
INSERT [dbo].[PostJob] ([Id], [Location], [Position], [Company], [LogoType], [Active], [DatePublish], [Token], [Description], [EmailReference], [DueDate], [IdTypeJob], [IdCategory], [URL]) VALUES (7, N'Remote Dev.', N'Software Application Developer', N'Acknowledgement', N'b722ab31224fca1ea110df31ca71116c.jpg', 1, CAST(N'2016-08-08 15:09:24.297' AS DateTime), N'D0C74995EF564A11743596186168818D', N'About Us

Acknowledgement design, build and operate software.

We’re looking for a software developer to join us and work on the development of one of our own products, a B2B customer service application. It’s a multi-tier, multi-technology suite of applications centred around highly-scalable Node.js layers, JSON:API microservices, PHP back-ends and modern JavaScript front-ends.

We don’t like to pigeonhole our developers into a particular speciality. So you’d particularly enjoy working with us if you want to use the whole range of your skills on fast moving, challenging and enjoyable projects.

We are based in Central London (Clerkenwell) but have members of the team based in remote locations.

We are open minded re perm / freelance.

Essential Skills

*Ideally two years’ commercial experience working as a developer, preferably with experience working in a busy agency or startup environment.

*Ideally two years’ experience working with object-oriented PHP and MySQL using at least one PHP MVC framework.

*Expert skills in writing hand-coded HTML5,CSS3 and JavaScript.

*Advanced experience with Ember.js.

*Experience integrating front-end websites with back-end systems via REST APIs.

*Experience with Laravel 5 PHP MVC framework.

*Experience with test-driven development.

*Experience with the Git source control system.

*Strong skills using Adobe Creative Suite (Photoshop, Illustrator, etc).

Preferable Skills

*Knowledge of the JSON:API specification.

*Knowledge of Node.js and relevant web technology packages such as Express for routing and Socket.IO for communication over web sockets.

*Experience using third-party APIs and SDKs.

*Experience with administering Linux servers on a command line.

*Experience with PHP Zend 2.0 framework.

*Excellent written and verbal communication skills.

Extra tags: JavaScript, php,api,Ember.js,Node.js,Laravel,JSON:API,', N'Some@gmail.com', CAST(N'2016-09-07 15:09:24.473' AS DateTime), 3, 2, N'Acknowledgement.com')
SET IDENTITY_INSERT [dbo].[PostJob] OFF
SET IDENTITY_INSERT [dbo].[TypeJob] ON 

INSERT [dbo].[TypeJob] ([Id], [Name]) VALUES (1, N'Full Time')
INSERT [dbo].[TypeJob] ([Id], [Name]) VALUES (2, N'Part Time')
INSERT [dbo].[TypeJob] ([Id], [Name]) VALUES (3, N'Freelance')
SET IDENTITY_INSERT [dbo].[TypeJob] OFF
SET IDENTITY_INSERT [dbo].[TypeUser] ON 

INSERT [dbo].[TypeUser] ([Id], [Name]) VALUES (1, N'Administrador')
INSERT [dbo].[TypeUser] ([Id], [Name]) VALUES (2, N'Affiliate')
SET IDENTITY_INSERT [dbo].[TypeUser] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [Token], [Active], [IdTypeUser]) VALUES (1, N'Julio Lizardo', N'12345678', N'jurav8@gmail.com', N'JK01082016', 1, 1)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [Token], [Active], [IdTypeUser]) VALUES (3, N'Emmanuel Lizardo', N'jel1980', N'lizardoravelo@gmail.com', N'A9A7373B6F66D3E098C68DBC83E2AD53', 1, 2)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [Token], [Active], [IdTypeUser]) VALUES (4, N'Alexa', N'123', N'ju@gma.com', N'CFB4654C996EC4B513745220CF1A8043', 1, 2)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [Token], [Active], [IdTypeUser]) VALUES (1002, N'Emmanuel Lizardo', N'Dajel1980', N'jurav9@gmail.com', N'10F1E9C09935E00659EDC3CFF6B451CB', 1, 2)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [Token], [Active], [IdTypeUser]) VALUES (1003, N'Yoka', N'123456789', N'yoka@gmail.com', N'1FD397C3ECE9FE65ABA256DA7439DCB8', 1, 1)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [Token], [Active], [IdTypeUser]) VALUES (1004, N'Enrique Carpio', N'123456789', N'ca@promese.com', N'CAAA992E429E4882710558083E35C37B', 1, 2)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [Token], [Active], [IdTypeUser]) VALUES (1005, N'nio', N'123', N'1@gmail.com', N'695EBED04DD1F67F67EB3F853F3BE728', 1, 2)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[HistoryPost]  WITH CHECK ADD  CONSTRAINT [FK_HistoryPost_PostJob] FOREIGN KEY([IdPostJob])
REFERENCES [dbo].[PostJob] ([Id])
GO
ALTER TABLE [dbo].[HistoryPost] CHECK CONSTRAINT [FK_HistoryPost_PostJob]
GO
ALTER TABLE [dbo].[HistoryPost]  WITH CHECK ADD  CONSTRAINT [FK_HistoryPost_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[HistoryPost] CHECK CONSTRAINT [FK_HistoryPost_User]
GO
ALTER TABLE [dbo].[PostJob]  WITH CHECK ADD  CONSTRAINT [FK_PostJob_Category] FOREIGN KEY([IdCategory])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[PostJob] CHECK CONSTRAINT [FK_PostJob_Category]
GO
ALTER TABLE [dbo].[PostJob]  WITH CHECK ADD  CONSTRAINT [FK_PostJob_TypeJob] FOREIGN KEY([IdTypeJob])
REFERENCES [dbo].[TypeJob] ([Id])
GO
ALTER TABLE [dbo].[PostJob] CHECK CONSTRAINT [FK_PostJob_TypeJob]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_TypeUser] FOREIGN KEY([IdTypeUser])
REFERENCES [dbo].[TypeUser] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_TypeUser]
GO
USE [master]
GO
ALTER DATABASE [HireMe] SET  READ_WRITE 
GO
