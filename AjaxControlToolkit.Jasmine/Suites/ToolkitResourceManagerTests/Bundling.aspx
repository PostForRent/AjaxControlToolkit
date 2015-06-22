﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Suites/Suite.Master" AutoEventWireup="true" CodeBehind="Bundling.aspx.cs" Inherits="AjaxControlToolkit.Jasmine.Suites.ToolkitResourceManagerTests.Bundling" %>

<%@ Register Assembly="AjaxControlToolkit.Jasmine" Namespace="AjaxControlToolkit.Jasmine.Suites.ToolkitResourceManager" TagPrefix="test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TestSuiteName" runat="server">ToolkitResourceManager Bundling</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="TestSuite" runat="server">
    <asp:TextBox runat="server" ID="Target" />
    <test:TestExtender runat="server" TargetControlID="Target" />

    <script>
        describe("ToolkitResourceManager", function() {

            describe("Bundling", function() {

                it("loads only static for testing purposes", function() {
                    var embeddedScripts = [].filter.call(document.scripts, function(script) {
                        return script.attributes["src"] && script.attributes["src"].value.startsWith("/ScriptResource");
                    });

                    expect(embeddedScripts.length).toBe(0);
                });

                it("loads one bundle", function() {
                    var bundles = [].filter.call(document.scripts, function(script) {
                        return script.attributes["src"] && /\/Scripts\/AjaxControlToolkit\/Bundle\?v=.+/.test(script.attributes["src"].value);
                    });

                    expect(bundles.length).toBe(1);
                });

                it("loads static debug custom script", function() {
                    var extender = Sys.Extended.UI.TestExtender;

                    expect(extender.ScriptMode).toBe("Debug");
                    expect(extender.ScriptSource).toBe("Static");
                });

                it("loads debug base script", function() {
                    var base = Sys.Extended.UI.BehaviorBase;

                    expect(base.ScriptSource).toBe("Static");
                })
            });

        });
    </script>

</asp:Content>
