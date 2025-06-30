param dataFactoryName string
param pipelineName string
param location string = resourceGroup().location
param pipelineDefinition object

resource adf 'Microsoft.DataFactory/factories@2018-06-01' = {
  name: dataFactoryName
  location: location
  properties: {}
}

resource pipeline 'Microsoft.DataFactory/factories/pipelines@2018-06-01' = {
  name: '${dataFactoryName}/${pipelineName}'
  properties: pipelineDefinition.properties
  dependsOn: [adf]
}
