extension microsoftGraph
param workspace string

// resource workspace_Microsoft_SecurityInsights_ed27aa54_2adc_4774_ae30_6f84a1de0213 'Microsoft.OperationalInsights/workspaces/providers/alertRules@2021-03-01-preview' = {
  resource workspace_Microsoft_SecurityInsights_85f2eac9_43f1_480e_b8ad_473375c195c0 'Microsoft.OperationalInsights/workspaces/providers/AutomationRules@2022-12-01-preview' = {
    name: '${workspace}/Microsoft.SecurityInsights/85f2eac9-43f1-480e-b8ad-473375c1c999'
    properties: {
      displayName: 'Demofest Automation Rule Test'
      order: 1
      triggeringLogic: {
        isEnabled: true
        triggersOn: 'Incidents'
        triggersWhen: 'Created'
        conditions: [
          {
            conditionType: 'Property'
            conditionProperties: {
              propertyName: 'IncidentTactics'
              operator: 'Contains'
              propertyValues: [
                'Persistence'
              ]
            }
          }
        ]
      }
      actions: [
        {
          order: 1
          actionType: 'ModifyProperties'
          actionConfiguration: {
            severity: null
            status: null
            classification: null
            classificationReason: null
            classificationComment: null
            owner: {
              objectId: 'b18ef471-be11-439d-9279-5ce4e18b976e'
              email: 'SampleEmail1@Contoso.com'
              assignedTo: null
              userPrincipalName: 'SampleUser@Contoso.com'
            }
            labels: null
          }
        }
      ]
    }
  }

resource myGraphApplication 'Microsoft.Graph/applications@v1.0' = {
  displayName: 'ContentAsCodeBicepAndARMTestSP'
  uniqueName: 'CaCBicepDemoFinal'
}
