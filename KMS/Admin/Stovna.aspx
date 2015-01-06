<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Stovna.aspx.cs" Inherits="Admin_Stovna" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="divAdmin">
        <div style="text-align: center" aria-disabled="False">
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" AnswerLabelText="Trygdar svar" AnswerRequiredErrorMessage="Trygdar svar krevst" CompleteSuccessText="Nýggjur brúkari er stovnaður" ConfirmPasswordCompareErrorMessage="Loyniorðini skulla verða líka" ConfirmPasswordLabelText="Re-Loyniorð" ConfirmPasswordRequiredErrorMessage="Loyniorðini skulla verða líka" ContinueButtonText="Víðari" CreateUserButtonText="Stovna brúkara" DuplicateEmailErrorMessage="Telduposturin er longu skrásettur" DuplicateUserNameErrorMessage="Vinarliga brúka eitt annað brúkaranavn" EmailLabelText="Teldupostur" EmailRegularExpressionErrorMessage="Vinarliga skriva ein annan teldupost" EmailRequiredErrorMessage="Vinarliga skriva teldupost" PasswordLabelText="Loyniorð" PasswordRegularExpressionErrorMessage="Vinarliga brúka eitt annað loyniorð" PasswordRequiredErrorMessage="Loyniorð krevst" QuestionLabelText="Trygdar spurningur" QuestionRequiredErrorMessage="Trygdar spurningurin er eitt krav" UnknownErrorMessage="Brúkarin er ikki stovnaður" UserNameLabelText="Brúkaranavn" UserNameRequiredErrorMessage="Brúkaranavn krevst" ContinueDestinationPageUrl="~/Admin/AdminHome.aspx">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" Title="Stovna nyggjan brúkara">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td align="center" colspan="2">Stovna brúkara</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Brúkaranavn</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Brúkaranavn krevst" ToolTip="Brúkaranavn krevst" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Loyniorð</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Loyniorð krevst" ToolTip="Loyniorð krevst" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Re-Loyniorð</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Loyniorðini skulla verða líka" ToolTip="Loyniorðini skulla verða líka" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">Teldupostur</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="Vinarliga skriva teldupost" ToolTip="Vinarliga skriva teldupost" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Trygdar spurningur</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Trygdar spurningurin er eitt krav" ToolTip="Trygdar spurningurin er eitt krav" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Trygdar svar</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Trygdar svar krevst" ToolTip="Trygdar svar krevst" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="Loyniorðini skulla verða líka" ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server" Title="Trin 2">
                </asp:CompleteWizardStep>
            </WizardSteps>
            <FinishNavigationTemplate>
                <asp:Button ID="FinishPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious" Text="Previous" />
                <asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" Text="Finish" />
            </FinishNavigationTemplate>
        </asp:CreateUserWizard>
        
        </div>

    </div>
</asp:Content>

