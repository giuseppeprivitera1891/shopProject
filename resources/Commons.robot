*** Settings ***
Library    SeleniumLibrary      screenshot_root_directory=${imagePath}
Library    ScreenCapLibrary     screenshot_directory=${videoPath}
Library    ExcelLibrary
Library    BuiltIn

*** Keywords ***
Open the browser
    open browser    ${url}       ${browser}
    maximize browser window
    set selenium speed    0.3 seconds

Open file
    [Arguments]  ${fileName}    ${sheetName}
    Open Excel Document 	filename=${fileName} 	    doc_id=${sheetName}

Close file
    Close Current Excel Document

Start video
    [Arguments]    ${name}
    IF    '${video}' == '${TRUE}'
                start video recording   name=${name}   monitor=1      embed=True
    END

Stop video
    IF    '${video}' == '${TRUE}'
                stop all video recordings    save_to_disk=True
    END

Close the browser
    close browser

*** Variables ***
${imagePath}    ../../PycharmProjects/shopProject/output/image
${videoPath}    ../../PycharmProjects/shopProject/output/video
${url}   https://rahulshettyacademy.com/loginpagePractise/
${video}    ${TRUE}
${browser}    chrome
