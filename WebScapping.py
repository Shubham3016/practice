
pip install Beautifulsoup4 # package which is used for WeB scapping

from urllib.request import urlopen as uReq
from bs4 import BeautifulSoup as soup
my_url="https://www.flipkart.com/google-chromecast-3-media-streaming-device/p/itmf9fc9hggsyzs5"

uClient = uReq(my_url)
page_html = uClient.read()
uClient.close()
page_soup = soup(page_html, "html.parser")

containers = page_soup.findAll("div", { "class": "_1HmYoV _35HD7C col-8-12"})

#print(len(containers))

#print(soup.prettify(containers[0]))

container = containers[0]
#print(container.div.img["alt"])

SingleUserRating = container.findAll("div", {"class": "hGSR34 E_uFuv"})

print(SingleUserRating[0].text)

SingleUserReview = container.findAll("p", {"class": "_2xg6Ul"})

print(SingleUserReview[0].text)

SingleUserName = container.findAll("p", {"class": "_3LYOAd _3sxSiS"})

product_name = container.findAll("span", {"class": "_35KyD6"})
print(product_name[0].text)
product_name = product_name[0].text

product_price = container.findAll("div", {"class": "_1vC4OE _3qQ9m1"})
print(product_price[0].text)
price = product_price[0].text

trim_price = ''.join(price.split(','))
rm_rupee = trim_price.split('₹')
add_rs_price = "Rs." + rm_rupee[1]
split_price = add_rs_price.split('E')
product_price = split_price[0]

product_rating = container.findAll("div", {"class": "hGSR34"})
print(product_rating[0].text)
product_rating = product_rating[0].text
"""

ratings = container.findAll("div", {"class": "niH0FQ"})
#rint(ratings[0].text)
"""
filename = "products.csv"
import io
f = io.open(filename, "a", encoding="utf-8")

#headers = "Product_Name, Pricing, Ratings, User_Name, User_Rating, User_Review \n"
#f.write(headers)

for i in range(0, len(SingleUserRating)):

    uname = SingleUserName[i].text
    urating = SingleUserRating[i].text
    ureview = SingleUserReview[i].text
    print("user name " + uname)
    print("user rating "+ urating)
    print("user review " + ureview)
    print(product_name + "," + product_price + "," + product_rating  + "," + uname  + "," + urating  + "," + ureview  + "\n")
    f.write(product_name + "," + product_price + "," + product_rating  + "," + uname  + "," + urating  + "," + ureview  + "\n")
f.close()
