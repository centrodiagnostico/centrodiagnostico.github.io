<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml"
xmlns:state="http://panax.io/state"
xmlns:xo="http://panax.io/xover"
exclude-result-prefixes="#default"
>
	<xsl:output method="xml"
	   omit-xml-declaration="yes"
	   indent="yes"/>

	<xsl:key name="active" match="estudios/item[@state:active]" use="'*'"/>
	<xsl:key name="active" match="estudios[not(@state:active)]" use="'*'"/>

	<xsl:template match="text()"/>

	<xsl:template match="/">
		<div class="container">
			<div class="row">
				<xsl:apply-templates select="key('active','*')"/>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="estudios">
		<a href="#estudios">Regresar a estudios</a>
	</xsl:template>

	<xsl:template match="estudios/item">
		<xsl:variable name="original_price" select="@o"/>
		<xsl:variable name="final_price" select="@o * (1-@p)"/>
		<section id="features" class="product-item-details">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div>
							<div class="product-view__title-icon">
								<img class="img-fluid" src="img/tubo.png" alt="" title=""/>
							</div>
							<div class="product-view__label label-container">
								Laboratorio
							</div>
							<div>
								<h1 class="h4">
									<span class="base">
										<xsl:value-of select="@n"/>
									</span>
								</h1>
							</div>
						</div>
						<p class="product-view__description mt-4">
							<xsl:value-of select="@d"/>
						</p>
					</div>
					<div class="col-lg-6">
						<div class="price mb-4">
							<xsl:if test="$original_price!=$final_price">
								<del class="text-danger" style="display: inline-flex; margin-left: auto">
									<xsl:value-of select="format-number($original_price,'$,###.00')"/>
								</del>
							</xsl:if>
							<span class="value-price fw-bold">
								<xsl:value-of select="format-number($final_price,'$,###.00')"/>
							</span>
						</div>
						<div class="card-more">
							<a href="estudios_product_item.html" class="btn btn-primary w-50 disabled">Agregar estudio</a>
						</div>
					</div>
				</div>
			</div>
			<section class="section">
				<div class="container">
					<div class="mb-5 text-center">
						<h3>
							¡Prepárate para tu estudio!
						</h3>
					</div>
					<div class="accordion accordion-flush" id="accordionFlushExample">
						<xsl:if test="@i">
							<div class="accordion-item">
								<h2 class="accordion-header" id="flush-headingOne">
									<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
										Indicaciones
									</button>
								</h2>
								<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
									<div class="accordion-body">
										<xsl:value-of select="@i"/>
									</div>
								</div>
							</div>
						</xsl:if>
						<xsl:if test="@pr">
							<div class="accordion-item">
								<h2 class="accordion-header" id="flush-headingTwo">
									<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
										Procedimiento
									</button>
								</h2>
								<div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
									<div class="accordion-body">
										<xsl:value-of select="@pr"/>
									</div>
								</div>
							</div>
						</xsl:if>
					</div>
				</div>
			</section>
		</section>
	</xsl:template>

</xsl:stylesheet>
