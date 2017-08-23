<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:default="http://turreta.com/default-ns" 
    xmlns:artist="http://turreta.com/artist-ns"
    xmlns:my-artist="http://turreta.com/artist-ns"
    xmlns:my-xsi="http://www.w3.org/2001/XMLSchema-instance">
     
    <xsl:output method="xml" indent="yes"/>
    <xsl:param name="removeCompany"/>
    
    <xsl:template match="@* | node()">
      <xsl:copy>
        <xsl:apply-templates select="@* | node()"/>
      </xsl:copy>
    </xsl:template>
    
    <xsl:template match="/default:CATALOG/default:CD/default:TITLE">
      <xsl:copy>
        <xsl:value-of select="translate(text(), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
      </xsl:copy>
    </xsl:template>
    
	<!-- Changes all 'type' attribute in /CATALOG/CD/PRICE
	<xsl:template match="/default:CATALOG/default:CD/default:PRICE/@my-xsi:type">
		<xsl:attribute name='xsi:type'>This is the value</xsl:attribute>
    </xsl:template> 
    -->
    
    <xsl:template match="/default:CATALOG/default:CD/default:PRICE[@my-xsi:type='WholeSalePrice']/@my-xsi:type">
		<xsl:attribute name='xsi:type'>whole-sale-price</xsl:attribute>
    </xsl:template>
    
    <xsl:template match="/default:CATALOG/default:CD/default:PRICE[@my-xsi:type='RetailSalePrice']/@my-xsi:type">
		<xsl:attribute name='xsi:type'>retail-sale-price</xsl:attribute>
    </xsl:template>
    
    <xsl:template match="/default:CATALOG/default:CD/artist:ARTIST[text()='Bob Dylan']">
      <xsl:copy>
        <xsl:value-of select="translate(text(), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
      </xsl:copy>
    </xsl:template>

    <xsl:template match="/default:CATALOG/default:CD/default:COMPANY">
        <xsl:choose>
            <xsl:when test="(removeCompany!='true')">
                <xsl:copy>
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:copy>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>