<%--
  Created by IntelliJ IDEA.
  User: abhit
  Date: 7/18/2025
  Time: 8:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 font-sans">
<div class="flex min-h-screen">

    <!-- nav bar -->
    <aside class="w-64 bg-white p-6 border-r">
        <div class="text-2xl font-bold text-green-600 mb-10">Pahana Edu Admin</div>
        <nav class="space-y-4 text-gray-700">
            <a href="AdminHome.jsp" class="block font-semibold text-green-600">Dashboard</a>
            <a href="#" class="block">Users</a>
            <a href="#" class="block">Reports</a>
            <a href="#" class="block">Settings</a>
            <a href="..\login.jsp" class="block text-red-500 mt-10">Logout</a>
        </nav>
    </aside>


    <main class="flex-1 p-8 overflow-y-auto">

        <div class="flex justify-between items-center mb-8">
            <h1 class="text-2xl font-bold">Welcome Admin</h1>
            <div class="flex items-center gap-4">
                <span class="text-sm text-gray-600">Admin User</span>
                <div class="w-8 h-8 rounded-full bg-gray-300"></div>
            </div>
        </div>

        <!-- Cards-->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            <div class="bg-white p-6 rounded-lg shadow">
                <h2 class="text-gray-500 text-sm mb-2">Total Users</h2>
                <p class="text-2xl font-semibold">1,254</p>
            </div>
            <div class="bg-white p-6 rounded-lg shadow">
                <h2 class="text-gray-500 text-sm mb-2">Monthly Sales</h2>
                <p class="text-2xl font-semibold">$24,390</p>
            </div>
            <div class="bg-white p-6 rounded-lg shadow">
                <h2 class="text-gray-500 text-sm mb-2">Active Sessions</h2>
                <p class="text-2xl font-semibold">82</p>
            </div>
        </div>

        <!-- User Table -->
        <div class="bg-white p-6 rounded-lg shadow mb-8">
            <h2 class="text-xl font-semibold mb-4">Recent Users</h2>
            <table class="min-w-full text-sm">
                <thead>
                <tr class="text-left border-b">
                    <th class="py-2">Name</th>
                    <th class="py-2">Email</th>
                    <th class="py-2">Role</th>
                    <th class="py-2">Status</th>
                </tr>
                </thead>
            </table>
        </div>

        <!-- Settings Panel -->
        <div class="bg-white p-6 rounded-lg shadow">
            <h2 class="text-xl font-semibold mb-4">System Settings</h2>
            <form action="SaveSettingsServlet" method="post" class="space-y-4">
                <div>
                    <label class="block text-sm font-medium">Site Title</label>
                    <input type="text" name="siteTitle" class="w-full mt-1 p-2 border rounded"
                           value="">
                </div>
                <div>
                    <label class="block text-sm font-medium">Notification Email</label>
                    <input type="email" name="adminEmail" class="w-full mt-1 p-2 border rounded"
                           value="">
                </div>
                <div>
                    <button class="mt-4 px-4 py-2 bg-green-600 text-white rounded hover:bg-green-700"
                            type="submit">
                        Save Settings
                    </button>
                </div>
            </form>
        </div>
    </main>
</div>
</body>
</html>

