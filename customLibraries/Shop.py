from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def add_items_to_cart(self, products_list):
        i = 1
        products_titles = self.selLib.get_webelements("css:.card-title")
        for product_title in products_titles:
            if product_title.text in products_list:
                self.selLib.click_button("xpath:(//*[@class='card-footer'])["+str(i)+"]/button")

            i = i + 1


