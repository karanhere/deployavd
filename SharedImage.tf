
data "azurerm_shared_image_version" "myimgversion" {
  name                = var.imageversion_name
  image_name          = "wsbaseimages"
  gallery_name        = "wsbaseimagerepo"
  resource_group_name = "Worksoft"
}
