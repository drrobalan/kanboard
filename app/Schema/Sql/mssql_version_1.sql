/****** Object:  Table [dbo].[tags]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[project_id] [int] NOT NULL,
 CONSTRAINT [PK_tags_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [tags$project_id] UNIQUE NONCLUSTERED 
(
	[project_id] ASC,
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[projects]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[projects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[is_active] [smallint] NULL,
	[token] [nvarchar](255) NULL,
	[last_modified] [bigint] NULL,
	[is_public] [smallint] NULL,
	[is_private] [smallint] NULL,
	[description] [nvarchar](max) NULL,
	[identifier] [nvarchar](50) NULL,
	[start_date] [nvarchar](10) NULL,
	[end_date] [nvarchar](10) NULL,
	[owner_id] [int] NULL,
	[priority_default] [int] NULL,
	[priority_start] [int] NULL,
	[priority_end] [int] NULL,
	[email] [nvarchar](255) NULL,
	[predefined_email_subjects] [nvarchar](max) NULL,
 CONSTRAINT [PK_projects_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[currencies]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[currencies](
	[currency] [nchar](3) NOT NULL,
	[rate] [real] NULL,
 CONSTRAINT [currencies$currency] UNIQUE CLUSTERED 
(
	[currency] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invites]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invites](
	[email] [nvarchar](190) NOT NULL,
	[project_id] [int] NOT NULL,
	[token] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_invites_email] PRIMARY KEY CLUSTERED 
(
	[email] ASC,
	[token] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[groups]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[groups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[external_id] [nvarchar](255) NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_groups_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [groups$name] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[links]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[links](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](255) NOT NULL,
	[opposite_id] [int] NULL,
 CONSTRAINT [PK_links_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [links$label] UNIQUE NONCLUSTERED 
(
	[label] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plugin_schema_versions]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plugin_schema_versions](
	[plugin] [nvarchar](80) NOT NULL,
	[version] [int] NOT NULL,
 CONSTRAINT [PK_plugin_schema_versions_plugin] PRIMARY KEY CLUSTERED 
(
	[plugin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[settings]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[settings](
	[option] [nvarchar](100) NOT NULL,
	[value] [nvarchar](max) NULL,
	[changed_by] [int] NOT NULL,
	[changed_on] [int] NOT NULL,
 CONSTRAINT [PK_settings_option] PRIMARY KEY CLUSTERED 
(
	[option] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sessions]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sessions](
	[id] [nvarchar](255) NOT NULL,
	[expire_at] [int] NOT NULL,
	[data] [nvarchar](max) NULL,
 CONSTRAINT [PK_sessions_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(2,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](255) NULL,
	[is_ldap_user] [smallint] NULL,
	[name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[google_id] [nvarchar](30) NULL,
	[github_id] [nvarchar](30) NULL,
	[notifications_enabled] [smallint] NULL,
	[timezone] [nvarchar](50) NULL,
	[language] [nvarchar](5) NULL,
	[disable_login_form] [smallint] NULL,
	[twofactor_activated] [smallint] NULL,
	[twofactor_secret] [nchar](16) NULL,
	[token] [nvarchar](255) NULL,
	[notifications_filter] [int] NULL,
	[nb_failed_login] [int] NULL,
	[lock_expiration_date] [bigint] NULL,
	[gitlab_id] [int] NULL,
	[role] [nvarchar](25) NOT NULL,
	[is_active] [smallint] NULL,
	[avatar_path] [nvarchar](255) NULL,
	[api_access_token] [nvarchar](255) NULL,
 CONSTRAINT [PK_users_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [users$users_username_idx] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_has_unread_notifications]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_has_unread_notifications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[date_creation] [bigint] NOT NULL,
	[event_name] [nvarchar](50) NOT NULL,
	[event_data] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_user_has_unread_notifications_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_has_notifications]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_has_notifications](
	[user_id] [int] NOT NULL,
	[project_id] [int] NOT NULL,
 CONSTRAINT [user_has_notifications$user_has_notifications_unique_idx] UNIQUE CLUSTERED 
(
	[user_id] ASC,
	[project_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_has_notification_types]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_has_notification_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[notification_type] [nvarchar](50) NULL,
 CONSTRAINT [PK_user_has_notification_types_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [user_has_notification_types$user_has_notification_types_user_idx] UNIQUE NONCLUSTERED 
(
	[user_id] ASC,
	[notification_type] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_has_metadata]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_has_metadata](
	[user_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[value] [nvarchar](255) NULL,
	[changed_by] [int] NOT NULL,
	[changed_on] [int] NOT NULL,
 CONSTRAINT [user_has_metadata$user_id] UNIQUE CLUSTERED 
(
	[user_id] ASC,
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[remember_me]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[remember_me](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[ip] [nvarchar](45) NULL,
	[user_agent] [nvarchar](255) NULL,
	[token] [nvarchar](255) NULL,
	[sequence] [nvarchar](255) NULL,
	[expiration] [int] NULL,
	[date_creation] [bigint] NULL,
 CONSTRAINT [PK_remember_me_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[password_reset]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[password_reset](
	[token] [nvarchar](80) NOT NULL,
	[user_id] [int] NOT NULL,
	[date_expiration] [int] NOT NULL,
	[date_creation] [int] NOT NULL,
	[ip] [nvarchar](45) NOT NULL,
	[user_agent] [nvarchar](255) NOT NULL,
	[is_active] [smallint] NOT NULL,
 CONSTRAINT [PK_password_reset_token] PRIMARY KEY CLUSTERED 
(
	[token] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[last_logins]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[last_logins](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[auth_type] [nvarchar](25) NULL,
	[user_id] [int] NULL,
	[ip] [nvarchar](45) NULL,
	[user_agent] [nvarchar](255) NULL,
	[date_creation] [bigint] NULL,
 CONSTRAINT [PK_last_logins_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[project_has_users]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project_has_users](
	[project_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[role] [nvarchar](255) NOT NULL,
 CONSTRAINT [project_has_users$idx_project_user] UNIQUE CLUSTERED 
(
	[project_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[project_has_roles]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project_has_roles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](255) NOT NULL,
	[project_id] [int] NOT NULL,
 CONSTRAINT [PK_project_has_roles_role_id] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [project_has_roles$project_id] UNIQUE NONCLUSTERED 
(
	[project_id] ASC,
	[role] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[project_has_notification_types]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project_has_notification_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[project_id] [int] NOT NULL,
	[notification_type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_project_has_notification_types_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [project_has_notification_types$project_id] UNIQUE NONCLUSTERED 
(
	[project_id] ASC,
	[notification_type] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[project_has_metadata]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project_has_metadata](
	[project_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[value] [nvarchar](255) NULL,
	[changed_by] [int] NOT NULL,
	[changed_on] [int] NOT NULL,
 CONSTRAINT [project_has_metadata$project_id] UNIQUE CLUSTERED 
(
	[project_id] ASC,
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[project_has_groups]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project_has_groups](
	[group_id] [int] NOT NULL,
	[project_id] [int] NOT NULL,
	[role] [nvarchar](255) NOT NULL,
 CONSTRAINT [project_has_groups$group_id] UNIQUE CLUSTERED 
(
	[group_id] ASC,
	[project_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[project_has_files]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project_has_files](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[project_id] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[path] [nvarchar](255) NOT NULL,
	[is_image] [smallint] NULL,
	[size] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[date] [int] NOT NULL,
 CONSTRAINT [PK_project_has_files_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[project_has_categories]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project_has_categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[project_id] [int] NOT NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_project_has_categories_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [project_has_categories$idx_project_category] UNIQUE NONCLUSTERED 
(
	[project_id] ASC,
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[project_daily_stats]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project_daily_stats](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[day] [nchar](10) NOT NULL,
	[project_id] [int] NOT NULL,
	[avg_lead_time] [int] NOT NULL,
	[avg_cycle_time] [int] NOT NULL,
 CONSTRAINT [PK_project_daily_stats_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [project_daily_stats$project_daily_stats_idx] UNIQUE NONCLUSTERED 
(
	[day] ASC,
	[project_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[group_has_users]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[group_has_users](
	[group_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [group_has_users$group_id] UNIQUE CLUSTERED 
(
	[group_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[custom_filters]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[custom_filters](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[filter] [nvarchar](100) NOT NULL,
	[project_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[is_shared] [smallint] NULL,
	[append] [smallint] NULL,
 CONSTRAINT [PK_custom_filters_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[actions]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[project_id] [int] NOT NULL,
	[event_name] [nvarchar](50) NOT NULL,
	[action_name] [nvarchar](255) NULL,
 CONSTRAINT [PK_actions_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[columns]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[columns](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[position] [int] NOT NULL,
	[project_id] [int] NOT NULL,
	[task_limit] [int] NULL,
	[description] [nvarchar](max) NULL,
	[hide_in_dashboard] [int] NOT NULL,
 CONSTRAINT [PK_columns_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [columns$idx_title_project] UNIQUE NONCLUSTERED 
(
	[title] ASC,
	[project_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[predefined_task_descriptions]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[predefined_task_descriptions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[project_id] [int] NOT NULL,
	[title] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_predefined_task_descriptions_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[swimlanes]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[swimlanes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[position] [int] NULL,
	[is_active] [int] NULL,
	[project_id] [int] NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_swimlanes_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [swimlanes$name] UNIQUE NONCLUSTERED 
(
	[name] ASC,
	[project_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tasks]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tasks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
	[date_creation] [bigint] NULL,
	[date_completed] [bigint] NULL,
	[date_due] [bigint] NULL,
	[color_id] [nvarchar](50) NULL,
	[project_id] [int] NOT NULL,
	[column_id] [int] NOT NULL,
	[owner_id] [int] NULL,
	[position] [int] NULL,
	[score] [int] NULL,
	[is_active] [smallint] NULL,
	[category_id] [int] NULL,
	[creator_id] [int] NULL,
	[date_modification] [int] NULL,
	[reference] [nvarchar](50) NULL,
	[date_started] [bigint] NULL,
	[time_spent] [real] NULL,
	[time_estimated] [real] NULL,
	[swimlane_id] [int] NOT NULL,
	[date_moved] [bigint] NULL,
	[recurrence_status] [int] NOT NULL,
	[recurrence_trigger] [int] NOT NULL,
	[recurrence_factor] [int] NOT NULL,
	[recurrence_timeframe] [int] NOT NULL,
	[recurrence_basedate] [int] NOT NULL,
	[recurrence_parent] [int] NULL,
	[recurrence_child] [int] NULL,
	[priority] [int] NULL,
	[external_provider] [nvarchar](255) NULL,
	[external_uri] [nvarchar](255) NULL,
 CONSTRAINT [PK_tasks_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[project_role_has_restrictions]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project_role_has_restrictions](
	[restriction_id] [int] IDENTITY(1,1) NOT NULL,
	[project_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
	[rule] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_project_role_has_restrictions_restriction_id] PRIMARY KEY CLUSTERED 
(
	[restriction_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [project_role_has_restrictions$role_id] UNIQUE NONCLUSTERED 
(
	[role_id] ASC,
	[rule] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[column_has_restrictions]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[column_has_restrictions](
	[restriction_id] [int] IDENTITY(1,1) NOT NULL,
	[project_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
	[column_id] [int] NOT NULL,
	[rule] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_column_has_restrictions_restriction_id] PRIMARY KEY CLUSTERED 
(
	[restriction_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [column_has_restrictions$role_id] UNIQUE NONCLUSTERED 
(
	[role_id] ASC,
	[column_id] ASC,
	[rule] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[column_has_move_restrictions]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[column_has_move_restrictions](
	[restriction_id] [int] IDENTITY(1,1) NOT NULL,
	[project_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
	[src_column_id] [int] NOT NULL,
	[dst_column_id] [int] NOT NULL,
	[only_assigned] [smallint] NULL,
 CONSTRAINT [PK_column_has_move_restrictions_restriction_id] PRIMARY KEY CLUSTERED 
(
	[restriction_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [column_has_move_restrictions$role_id] UNIQUE NONCLUSTERED 
(
	[role_id] ASC,
	[src_column_id] ASC,
	[dst_column_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[action_has_params]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[action_has_params](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[action_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[value] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_action_has_params_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[project_daily_column_stats]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project_daily_column_stats](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[day] [nchar](10) NOT NULL,
	[project_id] [int] NOT NULL,
	[column_id] [int] NOT NULL,
	[total] [int] NOT NULL,
	[score] [int] NOT NULL,
 CONSTRAINT [PK_project_daily_column_stats_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [project_daily_column_stats$project_daily_column_stats_idx] UNIQUE NONCLUSTERED 
(
	[day] ASC,
	[project_id] ASC,
	[column_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transitions]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transitions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[project_id] [int] NOT NULL,
	[task_id] [int] NOT NULL,
	[src_column_id] [int] NOT NULL,
	[dst_column_id] [int] NOT NULL,
	[date] [bigint] NULL,
	[time_spent] [int] NULL,
 CONSTRAINT [PK_transitions_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[project_activities]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[project_activities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date_creation] [bigint] NULL,
	[event_name] [nvarchar](50) NOT NULL,
	[creator_id] [int] NULL,
	[project_id] [int] NULL,
	[task_id] [int] NULL,
	[data] [nvarchar](max) NULL,
 CONSTRAINT [PK_project_activities_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[task_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[date_creation] [bigint] NULL,
	[comment] [nvarchar](max) NULL,
	[reference] [nvarchar](50) NULL,
	[date_modification] [bigint] NULL,
 CONSTRAINT [PK_comments_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[task_has_tags]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[task_has_tags](
	[task_id] [int] NOT NULL,
	[tag_id] [int] NOT NULL,
 CONSTRAINT [task_has_tags$tag_id] UNIQUE CLUSTERED 
(
	[tag_id] ASC,
	[task_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[task_has_metadata]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[task_has_metadata](
	[task_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[value] [nvarchar](255) NULL,
	[changed_by] [int] NOT NULL,
	[changed_on] [int] NOT NULL,
 CONSTRAINT [task_has_metadata$task_id] UNIQUE CLUSTERED 
(
	[task_id] ASC,
	[name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[task_has_links]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[task_has_links](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[link_id] [int] NOT NULL,
	[task_id] [int] NOT NULL,
	[opposite_task_id] [int] NOT NULL,
 CONSTRAINT [PK_task_has_links_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [task_has_links$task_has_links_unique] UNIQUE NONCLUSTERED 
(
	[link_id] ASC,
	[task_id] ASC,
	[opposite_task_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[task_has_files]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[task_has_files](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[path] [nvarchar](255) NULL,
	[is_image] [smallint] NULL,
	[task_id] [int] NOT NULL,
	[date] [bigint] NULL,
	[user_id] [int] NOT NULL,
	[size] [int] NOT NULL,
 CONSTRAINT [PK_task_has_files_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[task_has_external_links]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[task_has_external_links](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[link_type] [nvarchar](100) NOT NULL,
	[dependency] [nvarchar](100) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[url] [nvarchar](255) NOT NULL,
	[date_creation] [int] NOT NULL,
	[date_modification] [int] NOT NULL,
	[task_id] [int] NOT NULL,
	[creator_id] [int] NULL,
 CONSTRAINT [PK_task_has_external_links_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subtasks]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subtasks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[status] [int] NULL,
	[time_estimated] [real] NULL,
	[time_spent] [real] NULL,
	[task_id] [int] NOT NULL,
	[user_id] [int] NULL,
	[position] [int] NULL,
 CONSTRAINT [PK_subtasks_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subtask_time_tracking]    Script Date: 01/18/2018 16:13:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subtask_time_tracking](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[subtask_id] [int] NOT NULL,
	[start] [bigint] NULL,
	[end] [bigint] NULL,
	[time_spent] [real] NULL,
 CONSTRAINT [PK_subtask_time_tracking_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF__actions__action___2180FB33]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[actions] ADD  DEFAULT (NULL) FOR [action_name]
GO
/****** Object:  Default [DF__column_ha__only___22751F6C]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[column_has_move_restrictions] ADD  DEFAULT ((0)) FOR [only_assigned]
GO
/****** Object:  Default [DF__columns__task_li__236943A5]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[columns] ADD  DEFAULT ((0)) FOR [task_limit]
GO
/****** Object:  Default [DF__columns__hide_in__245D67DE]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[columns] ADD  DEFAULT ((0)) FOR [hide_in_dashboard]
GO
/****** Object:  Default [DF__comments__user_i__25518C17]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[comments] ADD  DEFAULT ((0)) FOR [user_id]
GO
/****** Object:  Default [DF__comments__date_c__2645B050]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[comments] ADD  DEFAULT (NULL) FOR [date_creation]
GO
/****** Object:  Default [DF__comments__refere__2739D489]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[comments] ADD  DEFAULT (N'') FOR [reference]
GO
/****** Object:  Default [DF__comments__date_m__282DF8C2]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[comments] ADD  DEFAULT (NULL) FOR [date_modification]
GO
/****** Object:  Default [DF__currencies__rate__29221CFB]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[currencies] ADD  DEFAULT ((0)) FOR [rate]
GO
/****** Object:  Default [DF__custom_fi__is_sh__2A164134]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[custom_filters] ADD  DEFAULT ((0)) FOR [is_shared]
GO
/****** Object:  Default [DF__custom_fi__appen__2B0A656D]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[custom_filters] ADD  DEFAULT ((0)) FOR [append]
GO
/****** Object:  Default [DF__groups__external__2BFE89A6]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[groups] ADD  DEFAULT (N'') FOR [external_id]
GO
/****** Object:  Default [DF__last_logi__auth___2CF2ADDF]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[last_logins] ADD  DEFAULT (NULL) FOR [auth_type]
GO
/****** Object:  Default [DF__last_logi__user___2DE6D218]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[last_logins] ADD  DEFAULT (NULL) FOR [user_id]
GO
/****** Object:  Default [DF__last_logins__ip__2EDAF651]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[last_logins] ADD  DEFAULT (NULL) FOR [ip]
GO
/****** Object:  Default [DF__last_logi__user___2FCF1A8A]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[last_logins] ADD  DEFAULT (NULL) FOR [user_agent]
GO
/****** Object:  Default [DF__last_logi__date___30C33EC3]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[last_logins] ADD  DEFAULT (NULL) FOR [date_creation]
GO
/****** Object:  Default [DF__links__opposite___31B762FC]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[links] ADD  DEFAULT ((0)) FOR [opposite_id]
GO
/****** Object:  Default [DF__plugin_sc__versi__32AB8735]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[plugin_schema_versions] ADD  DEFAULT ((0)) FOR [version]
GO
/****** Object:  Default [DF__project_a__date___339FAB6E]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_activities] ADD  DEFAULT (NULL) FOR [date_creation]
GO
/****** Object:  Default [DF__project_a__creat__3493CFA7]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_activities] ADD  DEFAULT (NULL) FOR [creator_id]
GO
/****** Object:  Default [DF__project_a__proje__3587F3E0]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_activities] ADD  DEFAULT (NULL) FOR [project_id]
GO
/****** Object:  Default [DF__project_a__task___367C1819]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_activities] ADD  DEFAULT (NULL) FOR [task_id]
GO
/****** Object:  Default [DF__project_d__total__37703C52]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_daily_column_stats] ADD  DEFAULT ((0)) FOR [total]
GO
/****** Object:  Default [DF__project_d__score__3864608B]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_daily_column_stats] ADD  DEFAULT ((0)) FOR [score]
GO
/****** Object:  Default [DF__project_d__avg_l__395884C4]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_daily_stats] ADD  DEFAULT ((0)) FOR [avg_lead_time]
GO
/****** Object:  Default [DF__project_d__avg_c__3A4CA8FD]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_daily_stats] ADD  DEFAULT ((0)) FOR [avg_cycle_time]
GO
/****** Object:  Default [DF__project_h__is_im__3B40CD36]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_has_files] ADD  DEFAULT ((0)) FOR [is_image]
GO
/****** Object:  Default [DF__project_ha__size__3C34F16F]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_has_files] ADD  DEFAULT ((0)) FOR [size]
GO
/****** Object:  Default [DF__project_h__user___3D2915A8]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_has_files] ADD  DEFAULT ((0)) FOR [user_id]
GO
/****** Object:  Default [DF__project_ha__date__3E1D39E1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_has_files] ADD  DEFAULT ((0)) FOR [date]
GO
/****** Object:  Default [DF__project_h__value__3F115E1A]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_has_metadata] ADD  DEFAULT (N'') FOR [value]
GO
/****** Object:  Default [DF__project_h__chang__40058253]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_has_metadata] ADD  DEFAULT ((0)) FOR [changed_by]
GO
/****** Object:  Default [DF__project_h__chang__40F9A68C]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_has_metadata] ADD  DEFAULT ((0)) FOR [changed_on]
GO
/****** Object:  Default [DF__projects__is_act__41EDCAC5]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[projects] ADD  DEFAULT ((1)) FOR [is_active]
GO
/****** Object:  Default [DF__projects__token__42E1EEFE]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[projects] ADD  DEFAULT (NULL) FOR [token]
GO
/****** Object:  Default [DF__projects__last_m__43D61337]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[projects] ADD  DEFAULT (NULL) FOR [last_modified]
GO
/****** Object:  Default [DF__projects__is_pub__44CA3770]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[projects] ADD  DEFAULT ((0)) FOR [is_public]
GO
/****** Object:  Default [DF__projects__is_pri__45BE5BA9]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[projects] ADD  DEFAULT ((0)) FOR [is_private]
GO
/****** Object:  Default [DF__projects__identi__46B27FE2]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[projects] ADD  DEFAULT (N'') FOR [identifier]
GO
/****** Object:  Default [DF__projects__start___47A6A41B]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[projects] ADD  DEFAULT (N'') FOR [start_date]
GO
/****** Object:  Default [DF__projects__end_da__489AC854]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[projects] ADD  DEFAULT (N'') FOR [end_date]
GO
/****** Object:  Default [DF__projects__owner___498EEC8D]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[projects] ADD  DEFAULT ((0)) FOR [owner_id]
GO
/****** Object:  Default [DF__projects__priori__4A8310C6]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[projects] ADD  DEFAULT ((0)) FOR [priority_default]
GO
/****** Object:  Default [DF__projects__priori__4B7734FF]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[projects] ADD  DEFAULT ((0)) FOR [priority_start]
GO
/****** Object:  Default [DF__projects__priori__4C6B5938]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[projects] ADD  DEFAULT ((3)) FOR [priority_end]
GO
/****** Object:  Default [DF__projects__email__4D5F7D71]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[projects] ADD  DEFAULT (NULL) FOR [email]
GO
/****** Object:  Default [DF__remember___user___4E53A1AA]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[remember_me] ADD  DEFAULT (NULL) FOR [user_id]
GO
/****** Object:  Default [DF__remember_me__ip__4F47C5E3]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[remember_me] ADD  DEFAULT (NULL) FOR [ip]
GO
/****** Object:  Default [DF__remember___user___503BEA1C]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[remember_me] ADD  DEFAULT (NULL) FOR [user_agent]
GO
/****** Object:  Default [DF__remember___token__51300E55]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[remember_me] ADD  DEFAULT (NULL) FOR [token]
GO
/****** Object:  Default [DF__remember___seque__5224328E]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[remember_me] ADD  DEFAULT (NULL) FOR [sequence]
GO
/****** Object:  Default [DF__remember___expir__531856C7]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[remember_me] ADD  DEFAULT (NULL) FOR [expiration]
GO
/****** Object:  Default [DF__remember___date___540C7B00]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[remember_me] ADD  DEFAULT (NULL) FOR [date_creation]
GO
/****** Object:  Default [DF__schema_ve__versi__55009F39]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[schema_version] ADD  DEFAULT ((0)) FOR [version]
GO
/****** Object:  Default [DF__settings__change__55F4C372]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[settings] ADD  DEFAULT ((0)) FOR [changed_by]
GO
/****** Object:  Default [DF__settings__change__56E8E7AB]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[settings] ADD  DEFAULT ((0)) FOR [changed_on]
GO
/****** Object:  Default [DF__subtask_t__start__57DD0BE4]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[subtask_time_tracking] ADD  DEFAULT (NULL) FOR [start]
GO
/****** Object:  Default [DF__subtask_tim__end__58D1301D]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[subtask_time_tracking] ADD  DEFAULT (NULL) FOR [end]
GO
/****** Object:  Default [DF__subtask_t__time___59C55456]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[subtask_time_tracking] ADD  DEFAULT ((0)) FOR [time_spent]
GO
/****** Object:  Default [DF__subtasks__status__5AB9788F]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[subtasks] ADD  DEFAULT ((0)) FOR [status]
GO
/****** Object:  Default [DF__subtasks__time_e__5BAD9CC8]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[subtasks] ADD  DEFAULT (NULL) FOR [time_estimated]
GO
/****** Object:  Default [DF__subtasks__time_s__5CA1C101]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[subtasks] ADD  DEFAULT (NULL) FOR [time_spent]
GO
/****** Object:  Default [DF__subtasks__user_i__5D95E53A]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[subtasks] ADD  DEFAULT (NULL) FOR [user_id]
GO
/****** Object:  Default [DF__subtasks__positi__5E8A0973]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[subtasks] ADD  DEFAULT ((1)) FOR [position]
GO
/****** Object:  Default [DF__swimlanes__posit__5F7E2DAC]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[swimlanes] ADD  DEFAULT ((1)) FOR [position]
GO
/****** Object:  Default [DF__swimlanes__is_ac__607251E5]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[swimlanes] ADD  DEFAULT ((1)) FOR [is_active]
GO
/****** Object:  Default [DF__swimlanes__proje__6166761E]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[swimlanes] ADD  DEFAULT (NULL) FOR [project_id]
GO
/****** Object:  Default [DF__task_has___creat__625A9A57]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[task_has_external_links] ADD  DEFAULT ((0)) FOR [creator_id]
GO
/****** Object:  Default [DF__task_has_f__path__634EBE90]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[task_has_files] ADD  DEFAULT (NULL) FOR [path]
GO
/****** Object:  Default [DF__task_has___is_im__6442E2C9]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[task_has_files] ADD  DEFAULT ((0)) FOR [is_image]
GO
/****** Object:  Default [DF__task_has_f__date__65370702]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[task_has_files] ADD  DEFAULT (NULL) FOR [date]
GO
/****** Object:  Default [DF__task_has___user___662B2B3B]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[task_has_files] ADD  DEFAULT ((0)) FOR [user_id]
GO
/****** Object:  Default [DF__task_has_f__size__671F4F74]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[task_has_files] ADD  DEFAULT ((0)) FOR [size]
GO
/****** Object:  Default [DF__task_has___value__681373AD]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[task_has_metadata] ADD  DEFAULT (N'') FOR [value]
GO
/****** Object:  Default [DF__task_has___chang__690797E6]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[task_has_metadata] ADD  DEFAULT ((0)) FOR [changed_by]
GO
/****** Object:  Default [DF__task_has___chang__69FBBC1F]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[task_has_metadata] ADD  DEFAULT ((0)) FOR [changed_on]
GO
/****** Object:  Default [DF__tasks__date_crea__6AEFE058]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT (NULL) FOR [date_creation]
GO
/****** Object:  Default [DF__tasks__date_comp__6BE40491]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT (NULL) FOR [date_completed]
GO
/****** Object:  Default [DF__tasks__date_due__6CD828CA]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT (NULL) FOR [date_due]
GO
/****** Object:  Default [DF__tasks__color_id__6DCC4D03]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT (NULL) FOR [color_id]
GO
/****** Object:  Default [DF__tasks__owner_id__6EC0713C]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT ((0)) FOR [owner_id]
GO
/****** Object:  Default [DF__tasks__position__6FB49575]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT (NULL) FOR [position]
GO
/****** Object:  Default [DF__tasks__score__70A8B9AE]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT (NULL) FOR [score]
GO
/****** Object:  Default [DF__tasks__is_active__719CDDE7]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT ((1)) FOR [is_active]
GO
/****** Object:  Default [DF__tasks__category___72910220]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT ((0)) FOR [category_id]
GO
/****** Object:  Default [DF__tasks__creator_i__73852659]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT ((0)) FOR [creator_id]
GO
/****** Object:  Default [DF__tasks__date_modi__74794A92]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT ((0)) FOR [date_modification]
GO
/****** Object:  Default [DF__tasks__reference__756D6ECB]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT (N'') FOR [reference]
GO
/****** Object:  Default [DF__tasks__date_star__76619304]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT (NULL) FOR [date_started]
GO
/****** Object:  Default [DF__tasks__time_spen__7755B73D]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT ((0)) FOR [time_spent]
GO
/****** Object:  Default [DF__tasks__time_esti__7849DB76]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT ((0)) FOR [time_estimated]
GO
/****** Object:  Default [DF__tasks__date_move__793DFFAF]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT (NULL) FOR [date_moved]
GO
/****** Object:  Default [DF__tasks__recurrenc__7A3223E8]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT ((0)) FOR [recurrence_status]
GO
/****** Object:  Default [DF__tasks__recurrenc__7B264821]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT ((0)) FOR [recurrence_trigger]
GO
/****** Object:  Default [DF__tasks__recurrenc__7C1A6C5A]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT ((0)) FOR [recurrence_factor]
GO
/****** Object:  Default [DF__tasks__recurrenc__7D0E9093]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT ((0)) FOR [recurrence_timeframe]
GO
/****** Object:  Default [DF__tasks__recurrenc__7E02B4CC]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT ((0)) FOR [recurrence_basedate]
GO
/****** Object:  Default [DF__tasks__recurrenc__7EF6D905]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT (NULL) FOR [recurrence_parent]
GO
/****** Object:  Default [DF__tasks__recurrenc__7FEAFD3E]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT (NULL) FOR [recurrence_child]
GO
/****** Object:  Default [DF__tasks__priority__00DF2177]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT ((0)) FOR [priority]
GO
/****** Object:  Default [DF__tasks__external___01D345B0]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT (NULL) FOR [external_provider]
GO
/****** Object:  Default [DF__tasks__external___02C769E9]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks] ADD  DEFAULT (NULL) FOR [external_uri]
GO
/****** Object:  Default [DF__transition__date__03BB8E22]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[transitions] ADD  DEFAULT (NULL) FOR [date]
GO
/****** Object:  Default [DF__transitio__time___04AFB25B]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[transitions] ADD  DEFAULT ((0)) FOR [time_spent]
GO
/****** Object:  Default [DF__user_has___value__05A3D694]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[user_has_metadata] ADD  DEFAULT (N'') FOR [value]
GO
/****** Object:  Default [DF__user_has___chang__0697FACD]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[user_has_metadata] ADD  DEFAULT ((0)) FOR [changed_by]
GO
/****** Object:  Default [DF__user_has___chang__078C1F06]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[user_has_metadata] ADD  DEFAULT ((0)) FOR [changed_on]
GO
/****** Object:  Default [DF__user_has___notif__0880433F]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[user_has_notification_types] ADD  DEFAULT (NULL) FOR [notification_type]
GO
/****** Object:  Default [DF__users__password__09746778]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [password]
GO
/****** Object:  Default [DF__users__is_ldap_u__0A688BB1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [is_ldap_user]
GO
/****** Object:  Default [DF__users__name__0B5CAFEA]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [name]
GO
/****** Object:  Default [DF__users__email__0C50D423]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [email]
GO
/****** Object:  Default [DF__users__google_id__0D44F85C]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [google_id]
GO
/****** Object:  Default [DF__users__github_id__0E391C95]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [github_id]
GO
/****** Object:  Default [DF__users__notificat__0F2D40CE]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [notifications_enabled]
GO
/****** Object:  Default [DF__users__timezone__10216507]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [timezone]
GO
/****** Object:  Default [DF__users__language__11158940]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [language]
GO
/****** Object:  Default [DF__users__disable_l__1209AD79]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [disable_login_form]
GO
/****** Object:  Default [DF__users__twofactor__12FDD1B2]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [twofactor_activated]
GO
/****** Object:  Default [DF__users__twofactor__13F1F5EB]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [twofactor_secret]
GO
/****** Object:  Default [DF__users__token__14E61A24]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[users] ADD  DEFAULT (N'') FOR [token]
GO
/****** Object:  Default [DF__users__notificat__15DA3E5D]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[users] ADD  DEFAULT ((4)) FOR [notifications_filter]
GO
/****** Object:  Default [DF__users__nb_failed__16CE6296]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [nb_failed_login]
GO
/****** Object:  Default [DF__users__lock_expi__17C286CF]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [lock_expiration_date]
GO
/****** Object:  Default [DF__users__gitlab_id__18B6AB08]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [gitlab_id]
GO
/****** Object:  Default [DF__users__role__19AACF41]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[users] ADD  DEFAULT (N'app-user') FOR [role]
GO
/****** Object:  Default [DF__users__is_active__1A9EF37A]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[users] ADD  DEFAULT ((1)) FOR [is_active]
GO
/****** Object:  Default [DF__users__avatar_pa__1B9317B3]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [avatar_path]
GO
/****** Object:  Default [DF__users__api_acces__1C873BEC]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [api_access_token]
GO
/****** Object:  ForeignKey [action_has_params$action_has_params_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[action_has_params]  WITH CHECK ADD  CONSTRAINT [action_has_params$action_has_params_ibfk_1] FOREIGN KEY([action_id])
REFERENCES [dbo].[actions] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[action_has_params] CHECK CONSTRAINT [action_has_params$action_has_params_ibfk_1]
GO
/****** Object:  ForeignKey [actions$actions_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[actions]  WITH CHECK ADD  CONSTRAINT [actions$actions_ibfk_1] FOREIGN KEY([project_id])
REFERENCES [dbo].[projects] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[actions] CHECK CONSTRAINT [actions$actions_ibfk_1]
GO
/****** Object:  ForeignKey [column_has_move_restrictions$column_has_move_restrictions_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[column_has_move_restrictions]  WITH CHECK ADD  CONSTRAINT [column_has_move_restrictions$column_has_move_restrictions_ibfk_1] FOREIGN KEY([project_id])
REFERENCES [dbo].[projects] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[column_has_move_restrictions] CHECK CONSTRAINT [column_has_move_restrictions$column_has_move_restrictions_ibfk_1]
GO
/****** Object:  ForeignKey [column_has_move_restrictions$column_has_move_restrictions_ibfk_2]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[column_has_move_restrictions]  WITH CHECK ADD  CONSTRAINT [column_has_move_restrictions$column_has_move_restrictions_ibfk_2] FOREIGN KEY([role_id])
REFERENCES [dbo].[project_has_roles] ([role_id])
GO
ALTER TABLE [dbo].[column_has_move_restrictions] CHECK CONSTRAINT [column_has_move_restrictions$column_has_move_restrictions_ibfk_2]
GO
/****** Object:  ForeignKey [column_has_move_restrictions$column_has_move_restrictions_ibfk_3]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[column_has_move_restrictions]  WITH CHECK ADD  CONSTRAINT [column_has_move_restrictions$column_has_move_restrictions_ibfk_3] FOREIGN KEY([src_column_id])
REFERENCES [dbo].[columns] ([id])
GO
ALTER TABLE [dbo].[column_has_move_restrictions] CHECK CONSTRAINT [column_has_move_restrictions$column_has_move_restrictions_ibfk_3]
GO
/****** Object:  ForeignKey [column_has_move_restrictions$column_has_move_restrictions_ibfk_4]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[column_has_move_restrictions]  WITH CHECK ADD  CONSTRAINT [column_has_move_restrictions$column_has_move_restrictions_ibfk_4] FOREIGN KEY([dst_column_id])
REFERENCES [dbo].[columns] ([id])
GO
ALTER TABLE [dbo].[column_has_move_restrictions] CHECK CONSTRAINT [column_has_move_restrictions$column_has_move_restrictions_ibfk_4]
GO
/****** Object:  ForeignKey [column_has_restrictions$column_has_restrictions_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[column_has_restrictions]  WITH CHECK ADD  CONSTRAINT [column_has_restrictions$column_has_restrictions_ibfk_1] FOREIGN KEY([project_id])
REFERENCES [dbo].[projects] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[column_has_restrictions] CHECK CONSTRAINT [column_has_restrictions$column_has_restrictions_ibfk_1]
GO
/****** Object:  ForeignKey [column_has_restrictions$column_has_restrictions_ibfk_2]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[column_has_restrictions]  WITH CHECK ADD  CONSTRAINT [column_has_restrictions$column_has_restrictions_ibfk_2] FOREIGN KEY([role_id])
REFERENCES [dbo].[project_has_roles] ([role_id])
GO
ALTER TABLE [dbo].[column_has_restrictions] CHECK CONSTRAINT [column_has_restrictions$column_has_restrictions_ibfk_2]
GO
/****** Object:  ForeignKey [column_has_restrictions$column_has_restrictions_ibfk_3]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[column_has_restrictions]  WITH CHECK ADD  CONSTRAINT [column_has_restrictions$column_has_restrictions_ibfk_3] FOREIGN KEY([column_id])
REFERENCES [dbo].[columns] ([id])
GO
ALTER TABLE [dbo].[column_has_restrictions] CHECK CONSTRAINT [column_has_restrictions$column_has_restrictions_ibfk_3]
GO
/****** Object:  ForeignKey [columns$columns_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[columns]  WITH CHECK ADD  CONSTRAINT [columns$columns_ibfk_1] FOREIGN KEY([project_id])
REFERENCES [dbo].[projects] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[columns] CHECK CONSTRAINT [columns$columns_ibfk_1]
GO
/****** Object:  ForeignKey [comments$comments_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [comments$comments_ibfk_1] FOREIGN KEY([task_id])
REFERENCES [dbo].[tasks] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [comments$comments_ibfk_1]
GO
/****** Object:  ForeignKey [custom_filters$custom_filters_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[custom_filters]  WITH CHECK ADD  CONSTRAINT [custom_filters$custom_filters_ibfk_1] FOREIGN KEY([project_id])
REFERENCES [dbo].[projects] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[custom_filters] CHECK CONSTRAINT [custom_filters$custom_filters_ibfk_1]
GO
/****** Object:  ForeignKey [custom_filters$custom_filters_ibfk_2]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[custom_filters]  WITH CHECK ADD  CONSTRAINT [custom_filters$custom_filters_ibfk_2] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[custom_filters] CHECK CONSTRAINT [custom_filters$custom_filters_ibfk_2]
GO
/****** Object:  ForeignKey [group_has_users$group_has_users_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[group_has_users]  WITH CHECK ADD  CONSTRAINT [group_has_users$group_has_users_ibfk_1] FOREIGN KEY([group_id])
REFERENCES [dbo].[groups] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[group_has_users] CHECK CONSTRAINT [group_has_users$group_has_users_ibfk_1]
GO
/****** Object:  ForeignKey [group_has_users$group_has_users_ibfk_2]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[group_has_users]  WITH CHECK ADD  CONSTRAINT [group_has_users$group_has_users_ibfk_2] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[group_has_users] CHECK CONSTRAINT [group_has_users$group_has_users_ibfk_2]
GO
/****** Object:  ForeignKey [last_logins$last_logins_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[last_logins]  WITH CHECK ADD  CONSTRAINT [last_logins$last_logins_ibfk_1] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[last_logins] CHECK CONSTRAINT [last_logins$last_logins_ibfk_1]
GO
/****** Object:  ForeignKey [password_reset$password_reset_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[password_reset]  WITH CHECK ADD  CONSTRAINT [password_reset$password_reset_ibfk_1] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[password_reset] CHECK CONSTRAINT [password_reset$password_reset_ibfk_1]
GO
/****** Object:  ForeignKey [predefined_task_descriptions$predefined_task_descriptions_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[predefined_task_descriptions]  WITH CHECK ADD  CONSTRAINT [predefined_task_descriptions$predefined_task_descriptions_ibfk_1] FOREIGN KEY([project_id])
REFERENCES [dbo].[projects] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[predefined_task_descriptions] CHECK CONSTRAINT [predefined_task_descriptions$predefined_task_descriptions_ibfk_1]
GO
/****** Object:  ForeignKey [project_activities$project_activities_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_activities]  WITH CHECK ADD  CONSTRAINT [project_activities$project_activities_ibfk_1] FOREIGN KEY([creator_id])
REFERENCES [dbo].[users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[project_activities] CHECK CONSTRAINT [project_activities$project_activities_ibfk_1]
GO
/****** Object:  ForeignKey [project_activities$project_activities_ibfk_2]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_activities]  WITH CHECK ADD  CONSTRAINT [project_activities$project_activities_ibfk_2] FOREIGN KEY([project_id])
REFERENCES [dbo].[projects] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[project_activities] CHECK CONSTRAINT [project_activities$project_activities_ibfk_2]
GO
/****** Object:  ForeignKey [project_activities$project_activities_ibfk_3]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_activities]  WITH CHECK ADD  CONSTRAINT [project_activities$project_activities_ibfk_3] FOREIGN KEY([task_id])
REFERENCES [dbo].[tasks] ([id])
GO
ALTER TABLE [dbo].[project_activities] CHECK CONSTRAINT [project_activities$project_activities_ibfk_3]
GO
/****** Object:  ForeignKey [project_daily_column_stats$project_daily_column_stats_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_daily_column_stats]  WITH CHECK ADD  CONSTRAINT [project_daily_column_stats$project_daily_column_stats_ibfk_1] FOREIGN KEY([column_id])
REFERENCES [dbo].[columns] ([id])
GO
ALTER TABLE [dbo].[project_daily_column_stats] CHECK CONSTRAINT [project_daily_column_stats$project_daily_column_stats_ibfk_1]
GO
/****** Object:  ForeignKey [project_daily_column_stats$project_daily_column_stats_ibfk_2]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_daily_column_stats]  WITH CHECK ADD  CONSTRAINT [project_daily_column_stats$project_daily_column_stats_ibfk_2] FOREIGN KEY([project_id])
REFERENCES [dbo].[projects] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[project_daily_column_stats] CHECK CONSTRAINT [project_daily_column_stats$project_daily_column_stats_ibfk_2]
GO
/****** Object:  ForeignKey [project_daily_stats$project_daily_stats_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_daily_stats]  WITH CHECK ADD  CONSTRAINT [project_daily_stats$project_daily_stats_ibfk_1] FOREIGN KEY([project_id])
REFERENCES [dbo].[projects] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[project_daily_stats] CHECK CONSTRAINT [project_daily_stats$project_daily_stats_ibfk_1]
GO
/****** Object:  ForeignKey [project_has_categories$project_has_categories_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_has_categories]  WITH CHECK ADD  CONSTRAINT [project_has_categories$project_has_categories_ibfk_1] FOREIGN KEY([project_id])
REFERENCES [dbo].[projects] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[project_has_categories] CHECK CONSTRAINT [project_has_categories$project_has_categories_ibfk_1]
GO
/****** Object:  ForeignKey [project_has_files$project_has_files_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_has_files]  WITH CHECK ADD  CONSTRAINT [project_has_files$project_has_files_ibfk_1] FOREIGN KEY([project_id])
REFERENCES [dbo].[projects] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[project_has_files] CHECK CONSTRAINT [project_has_files$project_has_files_ibfk_1]
GO
/****** Object:  ForeignKey [project_has_groups$project_has_groups_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_has_groups]  WITH CHECK ADD  CONSTRAINT [project_has_groups$project_has_groups_ibfk_1] FOREIGN KEY([group_id])
REFERENCES [dbo].[groups] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[project_has_groups] CHECK CONSTRAINT [project_has_groups$project_has_groups_ibfk_1]
GO
/****** Object:  ForeignKey [project_has_groups$project_has_groups_ibfk_2]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_has_groups]  WITH CHECK ADD  CONSTRAINT [project_has_groups$project_has_groups_ibfk_2] FOREIGN KEY([project_id])
REFERENCES [dbo].[projects] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[project_has_groups] CHECK CONSTRAINT [project_has_groups$project_has_groups_ibfk_2]
GO
/****** Object:  ForeignKey [project_has_metadata$project_has_metadata_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_has_metadata]  WITH CHECK ADD  CONSTRAINT [project_has_metadata$project_has_metadata_ibfk_1] FOREIGN KEY([project_id])
REFERENCES [dbo].[projects] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[project_has_metadata] CHECK CONSTRAINT [project_has_metadata$project_has_metadata_ibfk_1]
GO
/****** Object:  ForeignKey [project_has_notification_types$project_has_notification_types_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_has_notification_types]  WITH CHECK ADD  CONSTRAINT [project_has_notification_types$project_has_notification_types_ibfk_1] FOREIGN KEY([project_id])
REFERENCES [dbo].[projects] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[project_has_notification_types] CHECK CONSTRAINT [project_has_notification_types$project_has_notification_types_ibfk_1]
GO
/****** Object:  ForeignKey [project_has_roles$project_has_roles_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_has_roles]  WITH CHECK ADD  CONSTRAINT [project_has_roles$project_has_roles_ibfk_1] FOREIGN KEY([project_id])
REFERENCES [dbo].[projects] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[project_has_roles] CHECK CONSTRAINT [project_has_roles$project_has_roles_ibfk_1]
GO
/****** Object:  ForeignKey [project_has_users$project_has_users_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_has_users]  WITH CHECK ADD  CONSTRAINT [project_has_users$project_has_users_ibfk_1] FOREIGN KEY([project_id])
REFERENCES [dbo].[projects] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[project_has_users] CHECK CONSTRAINT [project_has_users$project_has_users_ibfk_1]
GO
/****** Object:  ForeignKey [project_has_users$project_has_users_ibfk_2]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_has_users]  WITH CHECK ADD  CONSTRAINT [project_has_users$project_has_users_ibfk_2] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[project_has_users] CHECK CONSTRAINT [project_has_users$project_has_users_ibfk_2]
GO
/****** Object:  ForeignKey [project_role_has_restrictions$project_role_has_restrictions_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_role_has_restrictions]  WITH CHECK ADD  CONSTRAINT [project_role_has_restrictions$project_role_has_restrictions_ibfk_1] FOREIGN KEY([project_id])
REFERENCES [dbo].[projects] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[project_role_has_restrictions] CHECK CONSTRAINT [project_role_has_restrictions$project_role_has_restrictions_ibfk_1]
GO
/****** Object:  ForeignKey [project_role_has_restrictions$project_role_has_restrictions_ibfk_2]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[project_role_has_restrictions]  WITH CHECK ADD  CONSTRAINT [project_role_has_restrictions$project_role_has_restrictions_ibfk_2] FOREIGN KEY([role_id])
REFERENCES [dbo].[project_has_roles] ([role_id])
GO
ALTER TABLE [dbo].[project_role_has_restrictions] CHECK CONSTRAINT [project_role_has_restrictions$project_role_has_restrictions_ibfk_2]
GO
/****** Object:  ForeignKey [remember_me$remember_me_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[remember_me]  WITH CHECK ADD  CONSTRAINT [remember_me$remember_me_ibfk_1] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[remember_me] CHECK CONSTRAINT [remember_me$remember_me_ibfk_1]
GO
/****** Object:  ForeignKey [subtask_time_tracking$subtask_time_tracking_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[subtask_time_tracking]  WITH CHECK ADD  CONSTRAINT [subtask_time_tracking$subtask_time_tracking_ibfk_1] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[subtask_time_tracking] CHECK CONSTRAINT [subtask_time_tracking$subtask_time_tracking_ibfk_1]
GO
/****** Object:  ForeignKey [subtask_time_tracking$subtask_time_tracking_ibfk_2]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[subtask_time_tracking]  WITH CHECK ADD  CONSTRAINT [subtask_time_tracking$subtask_time_tracking_ibfk_2] FOREIGN KEY([subtask_id])
REFERENCES [dbo].[subtasks] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[subtask_time_tracking] CHECK CONSTRAINT [subtask_time_tracking$subtask_time_tracking_ibfk_2]
GO
/****** Object:  ForeignKey [subtasks$subtasks_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[subtasks]  WITH CHECK ADD  CONSTRAINT [subtasks$subtasks_ibfk_1] FOREIGN KEY([task_id])
REFERENCES [dbo].[tasks] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[subtasks] CHECK CONSTRAINT [subtasks$subtasks_ibfk_1]
GO
/****** Object:  ForeignKey [swimlanes$swimlanes_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[swimlanes]  WITH CHECK ADD  CONSTRAINT [swimlanes$swimlanes_ibfk_1] FOREIGN KEY([project_id])
REFERENCES [dbo].[projects] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[swimlanes] CHECK CONSTRAINT [swimlanes$swimlanes_ibfk_1]
GO
/****** Object:  ForeignKey [task_has_external_links$task_has_external_links_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[task_has_external_links]  WITH CHECK ADD  CONSTRAINT [task_has_external_links$task_has_external_links_ibfk_1] FOREIGN KEY([task_id])
REFERENCES [dbo].[tasks] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[task_has_external_links] CHECK CONSTRAINT [task_has_external_links$task_has_external_links_ibfk_1]
GO
/****** Object:  ForeignKey [task_has_files$task_has_files_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[task_has_files]  WITH CHECK ADD  CONSTRAINT [task_has_files$task_has_files_ibfk_1] FOREIGN KEY([task_id])
REFERENCES [dbo].[tasks] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[task_has_files] CHECK CONSTRAINT [task_has_files$task_has_files_ibfk_1]
GO
/****** Object:  ForeignKey [task_has_links$task_has_links_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[task_has_links]  WITH CHECK ADD  CONSTRAINT [task_has_links$task_has_links_ibfk_1] FOREIGN KEY([link_id])
REFERENCES [dbo].[links] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[task_has_links] CHECK CONSTRAINT [task_has_links$task_has_links_ibfk_1]
GO
/****** Object:  ForeignKey [task_has_links$task_has_links_ibfk_2]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[task_has_links]  WITH CHECK ADD  CONSTRAINT [task_has_links$task_has_links_ibfk_2] FOREIGN KEY([task_id])
REFERENCES [dbo].[tasks] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[task_has_links] CHECK CONSTRAINT [task_has_links$task_has_links_ibfk_2]
GO
/****** Object:  ForeignKey [task_has_links$task_has_links_ibfk_3]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[task_has_links]  WITH CHECK ADD  CONSTRAINT [task_has_links$task_has_links_ibfk_3] FOREIGN KEY([opposite_task_id])
REFERENCES [dbo].[tasks] ([id])
GO
ALTER TABLE [dbo].[task_has_links] CHECK CONSTRAINT [task_has_links$task_has_links_ibfk_3]
GO
/****** Object:  ForeignKey [task_has_metadata$task_has_metadata_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[task_has_metadata]  WITH CHECK ADD  CONSTRAINT [task_has_metadata$task_has_metadata_ibfk_1] FOREIGN KEY([task_id])
REFERENCES [dbo].[tasks] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[task_has_metadata] CHECK CONSTRAINT [task_has_metadata$task_has_metadata_ibfk_1]
GO
/****** Object:  ForeignKey [task_has_tags$task_has_tags_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[task_has_tags]  WITH CHECK ADD  CONSTRAINT [task_has_tags$task_has_tags_ibfk_1] FOREIGN KEY([task_id])
REFERENCES [dbo].[tasks] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[task_has_tags] CHECK CONSTRAINT [task_has_tags$task_has_tags_ibfk_1]
GO
/****** Object:  ForeignKey [task_has_tags$task_has_tags_ibfk_2]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[task_has_tags]  WITH CHECK ADD  CONSTRAINT [task_has_tags$task_has_tags_ibfk_2] FOREIGN KEY([tag_id])
REFERENCES [dbo].[tags] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[task_has_tags] CHECK CONSTRAINT [task_has_tags$task_has_tags_ibfk_2]
GO
/****** Object:  ForeignKey [tasks$tasks_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [tasks$tasks_ibfk_1] FOREIGN KEY([project_id])
REFERENCES [dbo].[projects] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [tasks$tasks_ibfk_1]
GO
/****** Object:  ForeignKey [tasks$tasks_ibfk_2]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [tasks$tasks_ibfk_2] FOREIGN KEY([column_id])
REFERENCES [dbo].[columns] ([id])
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [tasks$tasks_ibfk_2]
GO
/****** Object:  ForeignKey [tasks$tasks_swimlane_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[tasks]  WITH CHECK ADD  CONSTRAINT [tasks$tasks_swimlane_ibfk_1] FOREIGN KEY([swimlane_id])
REFERENCES [dbo].[swimlanes] ([id])
GO
ALTER TABLE [dbo].[tasks] CHECK CONSTRAINT [tasks$tasks_swimlane_ibfk_1]
GO
/****** Object:  ForeignKey [transitions$transitions_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[transitions]  WITH CHECK ADD  CONSTRAINT [transitions$transitions_ibfk_1] FOREIGN KEY([src_column_id])
REFERENCES [dbo].[columns] ([id])
GO
ALTER TABLE [dbo].[transitions] CHECK CONSTRAINT [transitions$transitions_ibfk_1]
GO
/****** Object:  ForeignKey [transitions$transitions_ibfk_2]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[transitions]  WITH CHECK ADD  CONSTRAINT [transitions$transitions_ibfk_2] FOREIGN KEY([dst_column_id])
REFERENCES [dbo].[columns] ([id])
GO
ALTER TABLE [dbo].[transitions] CHECK CONSTRAINT [transitions$transitions_ibfk_2]
GO
/****** Object:  ForeignKey [transitions$transitions_ibfk_3]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[transitions]  WITH CHECK ADD  CONSTRAINT [transitions$transitions_ibfk_3] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[transitions] CHECK CONSTRAINT [transitions$transitions_ibfk_3]
GO
/****** Object:  ForeignKey [transitions$transitions_ibfk_4]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[transitions]  WITH CHECK ADD  CONSTRAINT [transitions$transitions_ibfk_4] FOREIGN KEY([project_id])
REFERENCES [dbo].[projects] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[transitions] CHECK CONSTRAINT [transitions$transitions_ibfk_4]
GO
/****** Object:  ForeignKey [transitions$transitions_ibfk_5]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[transitions]  WITH CHECK ADD  CONSTRAINT [transitions$transitions_ibfk_5] FOREIGN KEY([task_id])
REFERENCES [dbo].[tasks] ([id])
GO
ALTER TABLE [dbo].[transitions] CHECK CONSTRAINT [transitions$transitions_ibfk_5]
GO
/****** Object:  ForeignKey [user_has_metadata$user_has_metadata_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[user_has_metadata]  WITH CHECK ADD  CONSTRAINT [user_has_metadata$user_has_metadata_ibfk_1] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[user_has_metadata] CHECK CONSTRAINT [user_has_metadata$user_has_metadata_ibfk_1]
GO
/****** Object:  ForeignKey [user_has_notification_types$user_has_notification_types_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[user_has_notification_types]  WITH CHECK ADD  CONSTRAINT [user_has_notification_types$user_has_notification_types_ibfk_1] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[user_has_notification_types] CHECK CONSTRAINT [user_has_notification_types$user_has_notification_types_ibfk_1]
GO
/****** Object:  ForeignKey [user_has_notifications$user_has_notifications_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[user_has_notifications]  WITH CHECK ADD  CONSTRAINT [user_has_notifications$user_has_notifications_ibfk_1] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[user_has_notifications] CHECK CONSTRAINT [user_has_notifications$user_has_notifications_ibfk_1]
GO
/****** Object:  ForeignKey [user_has_notifications$user_has_notifications_ibfk_2]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[user_has_notifications]  WITH CHECK ADD  CONSTRAINT [user_has_notifications$user_has_notifications_ibfk_2] FOREIGN KEY([project_id])
REFERENCES [dbo].[projects] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[user_has_notifications] CHECK CONSTRAINT [user_has_notifications$user_has_notifications_ibfk_2]
GO
/****** Object:  ForeignKey [user_has_unread_notifications$user_has_unread_notifications_ibfk_1]    Script Date: 01/18/2018 16:13:41 ******/
ALTER TABLE [dbo].[user_has_unread_notifications]  WITH CHECK ADD  CONSTRAINT [user_has_unread_notifications$user_has_unread_notifications_ibfk_1] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[user_has_unread_notifications] CHECK CONSTRAINT [user_has_unread_notifications$user_has_unread_notifications_ibfk_1]
GO
INSERT INTO [dbo].[links] (label,opposite_id) VALUES ('relates to',0),('blocks',3),('is blocked by',2),('duplicates',5),('is duplicated by',4),('is a child of',7),('is a parent of',6),('targets milestone',9),('is a milestone of',8),('fixes',11),('is fixed by',10)
GO
INSERT INTO [dbo].[settings] VALUES ('api_token','36e88ee4ad58bc71a7879d8cadac15142fdd25550f4910b8ec8c7525730c',0,0),('application_currency','USD',0,0),('application_date_format','m/d/Y',0,0),('application_language','en_US',0,0),('application_stylesheet','',0,0),('application_timezone','UTC',0,0),('application_url','',0,0),('board_columns','',0,0),('board_highlight_period','172800',0,0),('board_private_refresh_interval','10',0,0),('board_public_refresh_interval','60',0,0),('calendar_project_tasks','date_started',0,0),('calendar_user_subtasks_time_tracking','0',0,0),('calendar_user_tasks','date_started',0,0),('cfd_include_closed_tasks','1',0,0),('default_color','yellow',0,0),('integration_gravatar','0',0,0),('password_reset','1',0,0),('project_categories','',0,0),('subtask_restriction','0',0,0),('subtask_time_tracking','1',0,0),('webhook_token','99225408c1094eead14b25dbe9f7254ec233bd54aea02b8dff7e7d25ae50',0,0),('webhook_url','',0,0)
GO
INSERT INTO [dbo].[users] (username, password, role) VALUES ('admin', '$2y$10$j/bvk6WblIHAyAJEBXLgBeoOjJ1oHsuA0VTUf85lRYOJ4czssCuI6', 'app-admin')
GO
INSERT INTO [dbo].[schema_version] VALUES ('1')
GO