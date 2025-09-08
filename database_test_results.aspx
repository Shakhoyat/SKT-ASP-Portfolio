<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="database_test_results.aspx.cs" Inherits="WebApplication1.database_test_results" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Database Connection and Admin Features Test</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 20px;
        }
        h1 {
            color: #333;
            border-bottom: 2px solid #ccc;
            padding-bottom: 10px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
        }
        .test-section {
            margin-bottom: 30px;
            border: 1px solid #ddd;
            padding: 15px;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .success {
            color: green;
            font-weight: bold;
        }
        .failure {
            color: red;
            font-weight: bold;
        }
        .test-title {
            font-size: 18px;
            margin-bottom: 10px;
            border-bottom: 1px solid #eee;
            padding-bottom: 5px;
        }
        .test-results {
            padding-left: 20px;
        }
        .btn {
            display: inline-block;
            padding: 8px 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-right: 10px;
            margin-bottom: 10px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .summary {
            font-weight: bold;
            margin-top: 20px;
            padding: 10px;
            background-color: #e9ecef;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Database and Admin Features Test Dashboard</h1>
            
            <p>
                This page tests your database connection and the functionality of your admin panel features.
                Click the buttons below to run the tests.
            </p>
            
            <div>
                <a href="test_database_connection.aspx" class="btn" target="_blank">Test Database Connection</a>
                <a href="test_admin_features.aspx" class="btn" target="_blank">Test Admin Features</a>
            </div>
            
            <div class="test-section">
                <div class="test-title">Database Connection Test</div>
                <div class="test-results" runat="server" id="dbConnectionResults">
                    <p>Click the "Test Database Connection" button above to run the test.</p>
                </div>
            </div>
            
            <div class="test-section">
                <div class="test-title">Admin Features Test</div>
                <div class="test-results" runat="server" id="adminFeaturesResults">
                    <p>Click the "Test Admin Features" button above to run the test.</p>
                </div>
            </div>
            
            <div class="summary" runat="server" id="summaryPanel">
                Once you've run the tests, you'll see a summary of the results here.
            </div>
            
            <p>
                <a href="AdminDashboard.aspx" class="btn">Go to Admin Dashboard</a>
            </p>
        </div>
    </form>
</body>
</html>