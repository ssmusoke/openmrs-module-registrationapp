<%
    if (sessionContext.authenticated && !sessionContext.currentProvider) {
        throw new IllegalStateException("Logged-in user is not a Provider")
    }
    ui.decorateWith("appui", "standardEmrPage")
    ui.includeCss("registrationapp", "summary.css")

%>

<script type="text/javascript">
    var breadcrumbs = [
        { icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
        { label: "${ ui.escapeJs(ui.format(patient.patient)) }" ,
            link: '${ui.pageLink("registrationapp", "registrationSummary", [patientId: patient.patient.id])}'}
    ]
    var patient = { id: ${ patient.id } };
</script>


${ ui.includeFragment("coreapps", "patientHeader", [ patient: patient.patient, activeVisit: null, appContextModel: null ]) }

${ ui.includeFragment("registrationapp", "summary/registrationSummary", [patient: patient, appId: "registrationapp.registerPatient"]) }