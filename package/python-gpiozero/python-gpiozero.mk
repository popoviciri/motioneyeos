################################################################################
#
# python-gpiozero
#
################################################################################

PYTHON_GPIOZERO_VERSION = 1.5.1
PYTHON_GPIOZERO_SOURCE = gpiozero-$(PYTHON_GPIOZERO_VERSION).tar.gz
PYTHON_GPIOZERO_SITE = https://files.pythonhosted.org/packages/ee/1e/66afe4ebdd22369be57ba66c2f1ceabcd7c4204c48f0ad4f14209b31d0f5
PYTHON_GPIOZERO_SETUP_TYPE = setuptools
PYTHON_GPIOZERO_LICENSE = Unlicense

$(eval $(python-package))
