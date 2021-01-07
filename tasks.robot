*** Settings ***
Documentation     CaptureFast Demo
Library           RPA.HTTP
Library           CaptureFast
Library           RPA.JSON
Library           OperatingSystem

*** Variables ***
${FILE_PATH} =    ${CURDIR}${/}NOTICE_OF_HEARING_001.pdf
${DOCUMENT_TYPE_ID} =    11790

*** Tasks ***
DocumentGetData
  ${documentid} =  UploadDocument   ${FILE_PATH}  ${DOCUMENT_TYPE_ID} 
    
  ${document_result} =  GetDocumentData   ${documentid}    
  
  ${new_obj}=  Convert JSON To String  ${document_result}

  Create File    ${CURDIR}${/}output${/}result.json    ${new_obj}   UTF-8



