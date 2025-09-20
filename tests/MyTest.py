from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.select import Select
from selenium.webdriver.common.action_chains import ActionChains
import time

driver = webdriver.Chrome()
name = "Marco Verdi"

driver.get("https://rahulshettyacademy.com/AutomationPractice/")

driver.maximize_window()

driver.implicitly_wait(15)

# radiobutton
radiobuttons = driver.find_elements(By.CSS_SELECTOR, ".radioButton")
radiobuttons[2].click()
assert radiobuttons[2].is_selected()

time.sleep(2)

# auto suggest
driver.find_element(By.ID, "autocomplete").send_keys("indi")
time.sleep(2)
countries = driver.find_elements(By.CSS_SELECTOR, "li[class='ui-menu-item']")

for country in countries:
    if country.text == "India":
        country.click()
        break

time.sleep(2)

# dropdown
dropdown = Select(driver.find_element(By.ID, "dropdown-class-example"))
dropdown.select_by_index(2)

time.sleep(2)

# checkbox
checkboxes = driver.find_elements(By.XPATH, "//input[@type='checkbox']")

print(len(checkboxes))

for checkbox in checkboxes:
    # scan all values in the list
    if checkbox.get_attribute("value") == "option2":
        checkbox.click()
        assert checkbox.is_selected()
        break

time.sleep(2)

# window
driver.find_element(By.XPATH, "//a[@id='opentab']").click()
# child window
windowsOpened = driver.window_handles

# switch to child window
driver.switch_to.window(windowsOpened[1])
print(driver.title)
time.sleep(3)
scrollButton = driver.find_element(By.XPATH, "//a[normalize-space()='Learn More']")
ActionChains(driver).scroll_to_element(scrollButton).perform()
time.sleep(2)
driver.close()
# switch to parent window
driver.switch_to.window(windowsOpened[0])
time.sleep(2)

# show the alert and accept it
driver.find_element(By.CSS_SELECTOR, "#name").send_keys(name)
driver.find_element(By.ID, "alertbtn").click()

time.sleep(1)

alert = driver.switch_to.alert
# get text from the alert
alertText = alert.text
print(alertText)

time.sleep(1)

alert.accept()

# Hide the textbox
displayedText = driver.find_element(By.ID, "displayed-text")

time.sleep(1)

displayedText.send_keys("Giorgio Rossi")

assert displayedText.is_displayed()

time.sleep(2)

driver.find_element(By.ID, "hide-textbox").click()

time.sleep(1)

assert not displayedText.is_displayed()

driver.find_element(By.ID, "show-textbox").click()

time.sleep(1)

assert displayedText.is_displayed()

time.sleep(2)

# mouse over
action = ActionChains(driver)
mouseOverButton = driver.find_element(By.ID, "mousehover")
action.move_to_element(mouseOverButton).perform()
topItem = driver.find_element(By.XPATH, "//a[normalize-space()='Reload']")
action.move_to_element(topItem).perform()
topItem.click()

time.sleep(2)


