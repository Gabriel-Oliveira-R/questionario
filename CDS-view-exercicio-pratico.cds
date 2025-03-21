@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Teste'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@OData.publish: true

@UI.headerInfo: {
    typeName: 'Nota', typeNamePlural: 'Notas'
}
define view entity Z_GOR_TESTE
                   as select from j_1bnfdoc as doc
                   left outer join j_1bnfe_active as ac
                   on doc.docnum = ac.docnum
{   
    @UI.lineItem: [{ position: 10, label : 'NF_ID' }]
    key doc.docnum,
    @Consumption.filter:{ selectionType: #INTERVAL, mandatory: true}
    @UI.lineItem: [{ position: 20, label : 'Empresa' }]
    doc.bukrs,
    @Consumption.filter:{ selectionType: #INTERVAL, mandatory: false}
    @UI.lineItem: [{ position: 30, label : 'Filial' }]
    doc.branch,
    @UI.lineItem: [{ position: 40, label : 'Número da NF-e' }]
    doc.nfenum,
    @UI.lineItem: [{ position: 50, label : 'Série da NF-e' }]
    doc.series,
    @Consumption.filter:{ selectionType: #INTERVAL, mandatory: false}
    @UI.lineItem: [{ position: 60, label : 'Código do destinatário' }]
    doc.parid,
    @UI.hidden
    doc.waerk, 
    @Semantics.amount.currencyCode: 'WAERK'
    @UI.lineItem: [{ position: 70, label : 'Valor total do documento' }]
    doc.vliq ,
    @UI.lineItem: [{ position: 80, label : 'Status da SEFAZ' }]
    ac.docsta,
    @Consumption.filter:{ selectionType: #INTERVAL, mandatory: false}
    @UI.lineItem: [{ position: 90, label : 'Data do documento' }]
    doc.docdat
} where doc.cancel is initial
      and doc.model = '55'
      
