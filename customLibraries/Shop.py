from robot.api.deco import keyword, library
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:

    def __int__(self):
        self.mylib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def hello_world(self):
        print("hello")

    @keyword
    def add_items_to_cart_and_checkout(self, productsList):
        i = 1
        productsTitles = self.mylib.get_webelements("css:.product-title")
        for productsTitle in productsTitles:
            if productsTitle.text in productsList:
                self.mylib.click_element("  xpath:(//*[@class='buttons'])[" + str(i) + "]")
            i = i + 1
