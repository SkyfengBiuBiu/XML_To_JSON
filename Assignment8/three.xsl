<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" />

	<xsl:template match="/movie_shop">
		{
		"movies":{
		"movie":[
		<xsl:variable name="id1" select="movies/movie[1]/@id" />
		<xsl:variable name="id2" select="movies/movie[2]/@id" />
		<xsl:variable name="id3" select="movies/movie[3]/@id" />
		<xsl:variable name="id4" select="movies/movie[4]/@id" />
		<xsl:variable name="id5" select="movies/movie[5]/@id" />
		<xsl:choose>
			<xsl:when
				test="customers/customer/rented_movies[descendant::text()=$id1]">
				{
				"id":"
				<xsl:value-of select="$id1" />
				",
				"is rented" : "yes"
				},
			</xsl:when>
			<xsl:otherwise>
				{
				"id":"
				<xsl:value-of select="$id1" />
				",
				"is rented" : "no"
				},
			</xsl:otherwise>
		</xsl:choose>

		<xsl:choose>
			<xsl:when
				test="customers/customer/rented_movies[descendant::text()=$id2]">
				{
				"id":"
				<xsl:value-of select="$id2" />
				",
				"is rented" : "yes"
				},
			</xsl:when>
			<xsl:otherwise>
				{
				"id":"
				<xsl:value-of select="$id2" />
				",
				"is rented" : "no"
				},
			</xsl:otherwise>
		</xsl:choose>

		<xsl:choose>
			<xsl:when
				test="customers/customer/rented_movies[descendant::text()=$id3]">
				{
				"id":"
				<xsl:value-of select="$id3" />
				",
				"is rented" : "yes"
				},
			</xsl:when>
			<xsl:otherwise>
				{
				"id":"
				<xsl:value-of select="$id3" />
				",
				"is rented" : "no"
				},
			</xsl:otherwise>
		</xsl:choose>

		<xsl:choose>
			<xsl:when
				test="customers/customer/rented_movies[descendant::text()=$id4]">
				{
				"id":"
				<xsl:value-of select="$id4" />
				",
				"is rented" : "yes"
				},
			</xsl:when>
			<xsl:otherwise>
				{
				"id":"
				<xsl:value-of select="$id4" />
				",
				"is rented" : "no"
				},
			</xsl:otherwise>
		</xsl:choose>

		<xsl:choose>
			<xsl:when
				test="customers/customer/rented_movies[descendant::text()=$id5]">
				{
				"id":"
				<xsl:value-of select="$id5" />
				",
				"is rented" : "yes"
				}
			</xsl:when>
			<xsl:otherwise>
				{
				"id":"
				<xsl:value-of select="$id5" />
				",
				"is rented" : "no"
				}
			</xsl:otherwise>
		</xsl:choose>

		]
		}}

	</xsl:template>

</xsl:stylesheet>

