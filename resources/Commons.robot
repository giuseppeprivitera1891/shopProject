*** Settings ***
Library    SeleniumLibrary      screenshot_root_directory=${imagePath}
Library    ScreenCapLibrary     screenshot_directory=${videoPath}    screenshot_module=PyGTK
Library    ExcelLibrary
Library    BuiltIn

*** Keywords ***
Open the browser
    Open Browser    ${url}       ${browser}
    Maximize Browser Window

Open file
    [Arguments]  ${fileName}    ${sheetName}
    Open Excel Document 	filename=${fileName} 	    doc_id=${sheetName}

Close file
    Close Current Excel Document

Start video
    [Arguments]    ${name}
    IF    '${video}' == '${TRUE}'
                Start Video Recording   name=${name}   monitor=1      embed=True
    END

Stop video
    IF    '${video}' == '${TRUE}'
                Stop All Video Recordings    save_to_disk=True
    END

Close the browser
    Close Browser

*** Variables ***
${imagePath}    ../../PycharmProjects/shopProject/output/image
${videoPath}    ../../PycharmProjects/shopProject/output/video
${url}   https://rahulshettyacademy.com/loginpagePractise/
${video}    ${TRUE}
${browser}    firefox
