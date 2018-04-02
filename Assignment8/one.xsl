<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" />

	<xsl:template match="/">
		{
		"customers":{
		"customer":[
		<xsl:for-each select="//customer">
			{
			"name":"
			<xsl:value-of select="./name" />",
			"movie":[
			<xsl:for-each select="rented_movies/rented_movie">
				<xsl:variable name="movieId" select="." />
				{
				"movie_name":"
				<xsl:value-of select="//movie[./@id=$movieId]/name" />
				",
				"movie_price":"
				<xsl:value-of select="//movie[./@id=$movieId]/price" />
				"
				}
				<xsl:if test="following-sibling::*">
					,
				</xsl:if>
			</xsl:for-each>
			],

			"sum":"
			<xsl:call-template name="get-total">
				<xsl:with-param name="items"
					select="rented_movies/rented_movie" />
			</xsl:call-template>
			"}
			<xsl:if test="following-sibling::*">
				,
			</xsl:if>
		</xsl:for-each>
		]

		}
		}
	</xsl:template>

	<xsl:template name="get-total">
		<xsl:param name="items" />
		<xsl:param name="total" select="0" />
		<xsl:param name="gtotal" select="0" />

		<xsl:choose>
			<xsl:when test="$items">
				<xsl:call-template name="get-total">
					<xsl:with-param name="items"
						select="$items[position() &gt; 1]" />
					<xsl:with-param name="total"
						select="$total + //movies/movie[@id=$items[1]]/price * $items[1]/@duration" />
					<xsl:with-param name="gtotal"
						select="$gtotal + $total" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="format-number($total,'#.00')" />

			</xsl:otherwise>

		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
