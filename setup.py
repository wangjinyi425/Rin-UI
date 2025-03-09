from setuptools import setup, find_packages

setup(
    name="rin-ui",
    version="0.1.0",
    packages=find_packages(),
    include_package_data=True,
    install_requires=["PySide6"],
    description="A Fluent Design-like UI library for Qt Quick (QML)",
    author="RinLit",
    author_email="lintu233_qwq@icloud.com",
    license="MIT",
    url="https://github.com/yourname/fluent-touch-ui",
)
