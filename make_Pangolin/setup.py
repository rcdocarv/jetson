from setuptools import setup
from setuptools.command.install import install
from distutils.sysconfig import get_python_lib
import glob
import shutil


__library_file__ = './pangolin*.so'
__version__ = '0.0.1'



class CopyLibFile(install):
    """
    Directly copy library file to python's site-packages directory.
    """

    def run(self):
        install_dir = get_python_lib()
        print(f'#### -> Install_dir {install_dir}')
        lib_file = glob.glob(__library_file__)
        print(f'#### -> Lib_file {lib_file}')
        #assert len(lib_file) == 1 and len(install_dir) >= 1

        """
        if not lib_file or len(lib_file) != 1:
            print("Erro: lib_file não está correto ou vazio.")
            exit(1)
        if not install_dir or len(install_dir) < 1:
            print("Erro: install_dir não está configurado corretamente.")
            exit(1)
        print('copying {} -> {}'.format(lib_file[0], install_dir[0]))
        """
        #shutil.copy(lib_file[0], install_dir)
        shutil.copy(lib_file[0], '/usr/lib/python3.8/')



setup(
    name='pangolin',
    version=__version__,
    description='python binding for lightweight 3D visualization library Pangolin.',
    url='https://github.com/uoip/pangolin',
    license='MIT',
    cmdclass=dict(
        install=CopyLibFile
    ),
    keywords='Pangolin, binding, OpenGL, 3D, visualization, Point Cloud',
    long_description="""This is a Python binding for c++ library Pangolin
        (https://github.com/stevenlovegrove/Pangolin).

        Pangolin is a lightweight portable rapid development library for managing
        OpenGL display / interaction and abstracting video input. At its heart is
        a simple OpenGl viewport manager which can help to modularise 3D visualisation
        without adding to its complexity, and offers an advanced but intuitive 3D navigation
        handler. Pangolin also provides a mechanism for manipulating program variables through
        config files and ui integration, and has a flexible real-time plotter for visualising
        graphical data."""
)
