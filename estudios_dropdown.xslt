<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml"
xmlns:state="http://panax.io/state"
xmlns:search="http://panax.io/search"
xmlns:xo="http://panax.io/xover"
exclude-result-prefixes="#default state search xsl xo"
>
	<xsl:output method="xml"
	   omit-xml-declaration="yes"
	   indent="yes"/>

	<xsl:key name="categoria" match="estudios/item" use="@c"/>

	<xsl:template match="text()"/>

	<xsl:template match="/*">
		<li id="estudios_dropdown" class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				Estudios
			</a>
			<ul class="dropdown-menu" aria-labelledby="navbarDropdown" xo-scope="{@xo:id}" xo-attribute="search:categoria">
				<xsl:for-each select="item[count(key('categoria',@c)[1]|.)=1]/@c">
					<xsl:sort select="." order="ascending"/>
					<li onclick="scope.set('{.}')">
						<xsl:if test=".=../../@search:categoria">
							<xsl:attribute name="onclick">scope.remove()</xsl:attribute>
						</xsl:if>
						<a class="dropdown-item" href="#">
							<xsl:if test=".=../../@search:categoria">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-funnel-fill" viewBox="0 0 16 16" style="margin-right:10px">
									<path d="M1.5 1.5A.5.5 0 0 1 2 1h12a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.128.334L10 8.692V13.5a.5.5 0 0 1-.342.474l-3 1A.5.5 0 0 1 6 14.5V8.692L1.628 3.834A.5.5 0 0 1 1.5 3.5v-2z"/>
								</svg>
							</xsl:if>
							<xsl:value-of select="."/>
						</a>
					</li>
				</xsl:for-each>
				<li>
					<hr class="dropdown-divider"/>
				</li>
				<li onclick="scope.remove()">
					<a class="dropdown-item" href="#">Ver todos los estudios</a>
				</li>
			</ul>
		</li>
	</xsl:template>
</xsl:stylesheet>
