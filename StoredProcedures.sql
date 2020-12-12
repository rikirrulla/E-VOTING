USE [Zgjedhjet]
GO

/****** Object:  StoredProcedure [dbo].[GjithsejKandidat]    Script Date: 7/17/2020 11:56:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GjithsejKandidat]

as 
	select count(*) from Kandidati
	return
GO


USE [Zgjedhjet]
GO

/****** Object:  StoredProcedure [dbo].[GjithsejPartite]    Script Date: 7/17/2020 11:56:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GjithsejPartite]

as 
	select count(*) from Partia
	return
GO



USE [Zgjedhjet]
GO

/****** Object:  StoredProcedure [dbo].[GjithsejVotuesit]    Script Date: 7/17/2020 11:56:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GjithsejVotuesit]

as 
	select count(*) from Personi
	return
GO



USE [Zgjedhjet]
GO

/****** Object:  StoredProcedure [dbo].[Kandidatet_Dashboard]    Script Date: 7/17/2020 11:56:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Kandidatet_Dashboard]

as 
SELECT
    kandidati_pare,
    COUNT (*)  AS 'kandidati_votat'
FROM
    Votat
	
GROUP BY
    kandidati_pare
	
ORDER BY
    kandidati_votat desc
offset 0 rows
fetch next 5 rows only;
	return
GO



USE [Zgjedhjet]
GO

/****** Object:  StoredProcedure [dbo].[KaneAplikar]    Script Date: 7/17/2020 11:56:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[KaneAplikar]

as 
	select count(*) from VerfikimiVotuesit
	return
GO



USE [Zgjedhjet]
GO

/****** Object:  StoredProcedure [dbo].[KaneVotuar]    Script Date: 7/17/2020 11:56:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[KaneVotuar]

as 
	select count(*) from Votat
	return
GO



USE [Zgjedhjet]
GO

/****** Object:  StoredProcedure [dbo].[NukKaneVotuar]    Script Date: 7/17/2020 11:57:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[NukKaneVotuar]

as 
	select count(*) from VerfikimiVotuesit where ka_votuar = 'Jo'
	return
GO




USE [Zgjedhjet]
GO

/****** Object:  StoredProcedure [dbo].[Partit_Dashboard]    Script Date: 7/17/2020 11:57:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

	CREATE procedure [dbo].[Partit_Dashboard]
		as
			SELECT p.emri_partis, 
(SELECT COUNT(*) FROM Votat v where p.emri_partis = v.emri_partis) AS 'partia_votat'
FROM Partia p
GROUP BY
		emri_partis
	
	ORDER BY
		partia_votat desc
		offset 0 rows
		fetch next 5 rows only;
		return
GO


