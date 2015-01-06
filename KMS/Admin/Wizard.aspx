<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Wizard.aspx.cs" Inherits="Admin_Wizard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="divAdminLibrary">
        <asp:Wizard ID="Wizard" runat="server"  ActiveStepIndex="0" CancelButtonText="Angra" FinishCompleteButtonText="Stovna" FinishPreviousButtonText="Aftur" StartNextButtonText="Víðari" StepNextButtonText="Víðari" StepPreviousButtonText="Aftur">
            <NavigationStyle ForeColor="#007583" />
            <WizardSteps>
                <asp:WizardStep ID="WizardStep1" runat="server" Title="Stovna kæru"></asp:WizardStep>
                <asp:WizardStep ID="WizardStep2" runat="server" Title="Lýsing"></asp:WizardStep>
                <asp:WizardStep ID="WizardStep3" runat="server" Title="Niðurstøða"></asp:WizardStep>
                <asp:WizardStep ID="WizardStep4" runat="server" Title="Ásetingar"></asp:WizardStep>
                <asp:WizardStep ID="WizardStep5" runat="server" Title="Evnir"></asp:WizardStep>
                <asp:WizardStep ID="WizardStep6" runat="server" Title="Leitiorð"></asp:WizardStep>
                
                
                <asp:WizardStep ID="WizardStep10" runat="server" Title="Lýsing"></asp:WizardStep>                                                    
            </WizardSteps>
        </asp:Wizard>
        <br />
    </div>
</asp:Content>


