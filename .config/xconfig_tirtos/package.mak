#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#

unexport MAKEFILE_LIST
MK_NOGENDEPS := $(filter clean,$(MAKECMDGOALS))
override PKGDIR = xconfig_tirtos
XDCINCS = -I. -I$(strip $(subst ;, -I,$(subst $(space),\$(space),$(XPKGPATH))))
XDCCFGDIR = package/cfg/

#
# The following dependencies ensure package.mak is rebuilt
# in the event that some included BOM script changes.
#
ifneq (clean,$(MAKECMDGOALS))
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/utils.js:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/utils.js
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/xdc.tci:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/xdc.tci
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/template.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/template.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/om2.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/om2.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/xmlgen.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/xmlgen.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/xmlgen2.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/xmlgen2.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/Warnings.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/Warnings.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/IPackage.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/IPackage.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/package.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/package.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/services/global/Clock.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/services/global/Clock.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/services/global/Trace.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/services/global/Trace.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/bld.js:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/bld.js
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/BuildEnvironment.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/BuildEnvironment.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/PackageContents.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/PackageContents.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/_gen.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/_gen.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/Library.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/Library.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/Executable.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/Executable.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/Repository.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/Repository.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/Configuration.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/Configuration.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/Script.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/Script.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/Manifest.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/Manifest.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/Utils.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/Utils.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/ITarget.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/ITarget.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/ITarget2.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/ITarget2.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/ITarget3.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/ITarget3.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/ITargetFilter.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/ITargetFilter.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/package.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/bld/package.xs
package.mak: config.bld
C:/ti/tirex-content/tirtos_cc32xx_2_16_00_08/products/bios_6_45_01_29/packages/ti/targets/ITarget.xs:
package.mak: C:/ti/tirex-content/tirtos_cc32xx_2_16_00_08/products/bios_6_45_01_29/packages/ti/targets/ITarget.xs
C:/ti/tirex-content/tirtos_cc32xx_2_16_00_08/products/bios_6_45_01_29/packages/ti/targets/C28_large.xs:
package.mak: C:/ti/tirex-content/tirtos_cc32xx_2_16_00_08/products/bios_6_45_01_29/packages/ti/targets/C28_large.xs
C:/ti/tirex-content/tirtos_cc32xx_2_16_00_08/products/bios_6_45_01_29/packages/ti/targets/C28_float.xs:
package.mak: C:/ti/tirex-content/tirtos_cc32xx_2_16_00_08/products/bios_6_45_01_29/packages/ti/targets/C28_float.xs
C:/ti/tirex-content/tirtos_cc32xx_2_16_00_08/products/bios_6_45_01_29/packages/ti/targets/package.xs:
package.mak: C:/ti/tirex-content/tirtos_cc32xx_2_16_00_08/products/bios_6_45_01_29/packages/ti/targets/package.xs
C:/ti/tirex-content/tirtos_cc32xx_2_16_00_08/products/bios_6_45_01_29/packages/ti/targets/arm/elf/IArm.xs:
package.mak: C:/ti/tirex-content/tirtos_cc32xx_2_16_00_08/products/bios_6_45_01_29/packages/ti/targets/arm/elf/IArm.xs
C:/ti/tirex-content/tirtos_cc32xx_2_16_00_08/products/bios_6_45_01_29/packages/ti/targets/arm/elf/package.xs:
package.mak: C:/ti/tirex-content/tirtos_cc32xx_2_16_00_08/products/bios_6_45_01_29/packages/ti/targets/arm/elf/package.xs
package.mak: package.bld
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/tools/configuro/template/compiler.opt.xdt:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/tools/configuro/template/compiler.opt.xdt
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/services/io/File.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/services/io/File.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/services/io/package.xs:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/services/io/package.xs
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/tools/configuro/template/compiler.defs.xdt:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/tools/configuro/template/compiler.defs.xdt
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/tools/configuro/template/custom.mak.exe.xdt:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/tools/configuro/template/custom.mak.exe.xdt
C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/tools/configuro/template/package.xs.xdt:
package.mak: C:/ti/tirex-content/xdctools_3_32_00_06_core/packages/xdc/tools/configuro/template/package.xs.xdt
endif

ti.targets.arm.elf.M4.rootDir ?= C:/ti/ccsv7/tools/compiler/ti-cgt-arm_16.9.0.LTS
ti.targets.arm.elf.packageBase ?= C:/ti/tirex-content/tirtos_cc32xx_2_16_00_08/products/bios_6_45_01_29/packages/ti/targets/arm/elf/
.PRECIOUS: $(XDCCFGDIR)/%.oem4
.PHONY: all,em4 .dlls,em4 .executables,em4 test,em4
all,em4: .executables,em4
.executables,em4: .libraries,em4
.executables,em4: .dlls,em4
.dlls,em4: .libraries,em4
.libraries,em4: .interfaces
	@$(RM) $@
	@$(TOUCH) "$@"

.help::
	@$(ECHO) xdc test,em4
	@$(ECHO) xdc .executables,em4
	@$(ECHO) xdc .libraries,em4
	@$(ECHO) xdc .dlls,em4


all: .executables 
.executables: .libraries .dlls
.libraries: .interfaces

PKGCFGS := $(wildcard package.xs) package/build.cfg
.interfaces: package/package.xdc.inc package/package.defs.h package.xdc $(PKGCFGS)

-include package/package.xdc.dep
package/%.xdc.inc package/%_xconfig_tirtos.c package/%.defs.h: %.xdc $(PKGCFGS)
	@$(MSG) generating interfaces for package xconfig_tirtos" (because $@ is older than $(firstword $?))" ...
	$(XSRUN) -f xdc/services/intern/cmd/build.xs $(MK_IDLOPTS) -m package/package.xdc.dep -i package/package.xdc.inc package.xdc

.dlls,em4 .dlls: tirtos.pem4

-include package/cfg/tirtos_pem4.mak
-include package/cfg/tirtos_pem4.cfg.mak
ifeq (,$(MK_NOGENDEPS))
-include package/cfg/tirtos_pem4.dep
endif
tirtos.pem4: package/cfg/tirtos_pem4.xdl
	@


ifeq (,$(wildcard .libraries,em4))
tirtos.pem4 package/cfg/tirtos_pem4.c: .libraries,em4
endif

package/cfg/tirtos_pem4.c package/cfg/tirtos_pem4.h package/cfg/tirtos_pem4.xdl: override _PROG_NAME := tirtos.xem4
package/cfg/tirtos_pem4.c: package/cfg/tirtos_pem4.cfg
package/cfg/tirtos_pem4.xdc.inc: package/cfg/tirtos_pem4.xdl
package/cfg/tirtos_pem4.xdl package/cfg/tirtos_pem4.c: .interfaces

clean:: clean,em4
	-$(RM) package/cfg/tirtos_pem4.cfg
	-$(RM) package/cfg/tirtos_pem4.dep
	-$(RM) package/cfg/tirtos_pem4.c
	-$(RM) package/cfg/tirtos_pem4.xdc.inc

clean,em4::
	-$(RM) tirtos.pem4
.executables,em4 .executables: tirtos.xem4

tirtos.xem4: |tirtos.pem4

-include package/cfg/tirtos.xem4.mak
tirtos.xem4: package/cfg/tirtos_pem4.oem4 
	$(RM) $@
	@$(MSG) lnkem4 $@ ...
	$(RM) $(XDCCFGDIR)/$@.map
	$(ti.targets.arm.elf.M4.rootDir)/bin/armcl -fs $(XDCCFGDIR)$(dir $@). -q -u _c_int00 --silicon_version=7M4 -z --strict_compatibility=on  -o $@ package/cfg/tirtos_pem4.oem4   package/cfg/tirtos_pem4.xdl  -w -c -m $(XDCCFGDIR)/$@.map -l $(ti.targets.arm.elf.M4.rootDir)/lib/libc.a
	
tirtos.xem4: export C_DIR=
tirtos.xem4: PATH:=$(ti.targets.arm.elf.M4.rootDir)/bin/;$(PATH)
tirtos.xem4: Path:=$(ti.targets.arm.elf.M4.rootDir)/bin/;$(PATH)

tirtos.test test,em4 test: tirtos.xem4.test

tirtos.xem4.test:: tirtos.xem4
ifeq (,$(_TESTLEVEL))
	@$(MAKE) -R -r --no-print-directory -f $(XDCROOT)/packages/xdc/bld/xdc.mak _TESTLEVEL=1 tirtos.xem4.test
else
	@$(MSG) running $<  ...
	$(call EXEC.tirtos.xem4, ) 
endif

clean,em4::
	-$(RM) $(wildcard .tmp,tirtos.xem4,*)


clean:: clean,em4

clean,em4::
	-$(RM) tirtos.xem4
%,copy:
	@$(if $<,,$(MSG) don\'t know how to build $*; exit 1)
	@$(MSG) cp $< $@
	$(RM) $@
	$(CP) $< $@
tirtos_pem4.oem4,copy : package/cfg/tirtos_pem4.oem4
tirtos_pem4.sem4,copy : package/cfg/tirtos_pem4.sem4

$(XDCCFGDIR)%.c $(XDCCFGDIR)%.h $(XDCCFGDIR)%.xdl: $(XDCCFGDIR)%.cfg $(XDCROOT)/packages/xdc/cfg/Main.xs | .interfaces
	@$(MSG) "configuring $(_PROG_NAME) from $< ..."
	$(CONFIG) $(_PROG_XSOPTS) xdc.cfg $(_PROG_NAME) $(XDCCFGDIR)$*.cfg $(XDCCFGDIR)$*

.PHONY: release,xconfig_tirtos
ifeq (,$(MK_NOGENDEPS))
-include package/rel/xconfig_tirtos.tar.dep
endif
package/rel/xconfig_tirtos/xconfig_tirtos/package/package.rel.xml: package/package.bld.xml
package/rel/xconfig_tirtos/xconfig_tirtos/package/package.rel.xml: package/build.cfg
package/rel/xconfig_tirtos/xconfig_tirtos/package/package.rel.xml: package/package.xdc.inc
package/rel/xconfig_tirtos/xconfig_tirtos/package/package.rel.xml: .force
	@$(MSG) generating external release references $@ ...
	$(XS) $(JSENV) -f $(XDCROOT)/packages/xdc/bld/rel.js $(MK_RELOPTS) . $@

xconfig_tirtos.tar: package/rel/xconfig_tirtos.xdc.inc package/rel/xconfig_tirtos/xconfig_tirtos/package/package.rel.xml
	@$(MSG) making release file $@ "(because of $(firstword $?))" ...
	-$(RM) $@
	$(call MKRELTAR,package/rel/xconfig_tirtos.xdc.inc,package/rel/xconfig_tirtos.tar.dep)


release release,xconfig_tirtos: all xconfig_tirtos.tar
clean:: .clean
	-$(RM) xconfig_tirtos.tar
	-$(RM) package/rel/xconfig_tirtos.xdc.inc
	-$(RM) package/rel/xconfig_tirtos.tar.dep

clean:: .clean
	-$(RM) .libraries $(wildcard .libraries,*)
clean:: 
	-$(RM) .dlls $(wildcard .dlls,*)
#
# The following clean rule removes user specified
# generated files or directories.
#

ifneq (clean,$(MAKECMDGOALS))
ifeq (,$(wildcard package))
    $(shell $(MKDIR) package)
endif
ifeq (,$(wildcard package/cfg))
    $(shell $(MKDIR) package/cfg)
endif
ifeq (,$(wildcard package/lib))
    $(shell $(MKDIR) package/lib)
endif
ifeq (,$(wildcard package/rel))
    $(shell $(MKDIR) package/rel)
endif
ifeq (,$(wildcard package/internal))
    $(shell $(MKDIR) package/internal)
endif
endif
clean::
	-$(RMDIR) package

include custom.mak
