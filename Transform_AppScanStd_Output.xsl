<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:template match="/XmlReport">
		<html>
			<head>
				<!--
					<link rel="stylesheet" href="./bootstrap-3.3.7-dist/css/bootstrap.min.css"  />
					<link rel="stylesheet" type="text/css" href="datatables/datatables.min.css"/>
				-->
				<!--<script type="text/javascript" src="datatables/datatables.min.js"></script> -->
				
				<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs-3.3.6/jq-2.2.3/dt-1.10.12/fh-3.1.2/sc-1.4.2/datatables.min.css"/>
				<script type="text/javascript" src="https://cdn.datatables.net/v/bs-3.3.6/jq-2.2.3/dt-1.10.12/fh-3.1.2/sc-1.4.2/datatables.min.js"></script>
				<!--
					var chart = new CanvasJS.Chart("chartContainer",
					{
					theme: "theme2",
					title:{
					text: "Vulnerabilities"
					},		
					data: [
					{       
					type: "pie",
					showInLegend: true,
					toolTipContent: "{y} - #percent %",
					yValueFormatString: "#,###,### Vulnerabilities",
					legendText: "{indexLabel}",
					dataPoints: [
					{  y: <xsl:value-of select="Summary/Hosts/Host/TotalInformationalIssues"/>, indexLabel: "Informational", color: "rgba(66, 134, 244, 1)" },
					{  y: <xsl:value-of select="Summary/Hosts/Host/TotalLowSeverityIssues"/>, indexLabel: "Low", color: "rgba(255, 255, 102, 1)" },
					{  y: <xsl:value-of select="Summary/Hosts/Host/TotalMediumSeverityIssues"/>, indexLabel: "Medium", color: "rgba(255, 194, 102, 1)" },
					{  y: <xsl:value-of select="Summary/Hosts/Host/TotalHighSeverityIssues"/>, indexLabel: "High", color: "rgba(255, 128, 128, 1)" }
					]
					}
					]
					});
					chart.render();
				-->
				<script>
					$(document).ready(function() {
						$('#vulnerabilities').DataTable({
						});
					});
				</script>
				
				<script type="text/javascript" src="ChartJS/canvasjs.min.js"></script>
				
				
				<style>
					tr.High {
						background-color: #ff8080;
					}
					
					tr.Medium {
						background-color: #ffc266;
					}
					
					tr.Low {
						background-color: #ffff66;
					}
					
					tr.Informational {
						background-color: #4286f4;
					}
					
				</style>
				
			</head>
			<body>
				<div id="background" style="background-color: #000; padding: 20px;">
					<div id="foreground" style="background-color: #fff; padding: 20px;">
						<h2 style="text-align: center">AppScan Standard Results</h2>
						<div id="topContainer">
							<div id="summaryContainer">
								<h3>Summary:</h3>
								<h4>Total Issues: <xsl:value-of select="Summary/TotalIssues"/></h4>
								<h3>Hosts</h3>
								<xsl:for-each select="Summary/Hosts/Host">
									<ul>
										<li>Host: <xsl:value-of select="@Name"/></li>
										<li>Informational Issues: <xsl:value-of select="TotalInformationalIssues"/></li>
										<li>Low Severity Issues: <xsl:value-of select="TotalLowSeverityIssues"/></li>
										<li>Medium Severity Issues: <xsl:value-of select="TotalMediumSeverityIssues"/></li>
										<li>High Severity Issues: <xsl:value-of select="TotalHighSeverityIssues"/></li>
										<li>Total Issues: <xsl:value-of select="Total"/></li>
									</ul>
								</xsl:for-each>
							</div>
						</div>
						<div id="issueTable">
							<h2>Issues</h2>
							<table class="table table-bordered table-hover" id="vulnerabilities">
								<thead class="thead-inverse">
									<tr>
										<th>Severity</th>
										<th>CVSS Score</th>
										<th>CWE</th>
										<th>Issue Type</th>
										<th>URL</th>
									</tr>
								</thead>
								<tbody>
									<xsl:for-each select="Results/Issues/Issue">
										<xsl:element name="tr">
											<xsl:attribute name="class"><xsl:value-of select="Severity"/></xsl:attribute>
											<td><xsl:value-of select="Severity"/></td>
											<td><xsl:value-of select="CVSS/Score"/></td>
											<td>
												<xsl:element name="a">
													<xsl:attribute name="href">
														<xsl:value-of select="/XmlReport/Results/IssueTypes/IssueType[@ID=current()/@IssueTypeID]/advisory/cwe/link/@target"/>
													</xsl:attribute>
													<xsl:attribute name="target">
														_blank
													</xsl:attribute>
													<xsl:value-of select="/XmlReport/Results/IssueTypes/IssueType[@ID=current()/@IssueTypeID]/advisory/cwe/link/@id"/>
												</xsl:element>
											</td>
											<td><xsl:value-of select="/XmlReport/Results/IssueTypes/IssueType[@ID=current()/@IssueTypeID]/advisory/name"/></td>
											<td><xsl:value-of select="Url"/></td>
										</xsl:element>
										
									</xsl:for-each>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
			</body>
		</html>
	</xsl:template>
	
</xsl:stylesheet>	