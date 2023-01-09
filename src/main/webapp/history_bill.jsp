<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.model.NumberFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.model.Bill" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en" xmlns:x-transition="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Tables - Windmill Dashboard</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
  <link
          href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
          rel="stylesheet"
  />
  <link rel="stylesheet" href="admin/assets/css/tailwind.output.css" />
  <link rel="stylesheet" href="admin/assets/css/filter.css" />
  <script
          src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
          defer
  ></script>
  <script src="admin/assets/js/init-alpine.js"></script>
  <style>
    .error{
      color: red;
      font-size: 14px;
    }
  </style>
</head>
<body>
<div
        class="flex h-screen bg-gray-50 dark:bg-gray-900"
        :class="{ 'overflow-hidden': isSideMenuOpen}"
>
  <!-- Desktop sidebar -->
  <aside
          class="z-20 flex-shrink-0 hidden w-64 overflow-y-auto bg-white dark:bg-gray-800 md:block"
  >
    <div class="py-4 text-gray-500 dark:text-gray-400">
      <a
              class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200"
              href="#"
      >
        Admin
      </a>
      <ul class="mt-6">
        <li class="relative px-6 py-3">
          <a
                  class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                  href="#"
          >
            <svg
                    class="w-5 h-5"
                    aria-hidden="true"
                    fill="none"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
            >
              <path
                      d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"
              ></path>
            </svg>
            <span class="ml-4">Quản lý</span>
          </a>
        </li>
      </ul>
      <ul>
        <li class="relative px-6 py-3">

          <a
                  class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                  href="ProductManagement.html"
          >
            <svg
                    class="w-5 h-5"
                    aria-hidden="true"
                    fill="none"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
            >
              <path d="M4 6h16M4 10h16M4 14h16M4 18h16"></path>
            </svg>
            <span class="ml-4">Quản lí sản phẩm</span>
          </a>
        </li>
        <li class="relative px-6 py-3">
                <span
                        class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
                        aria-hidden="true"
                ></span>
          <a
                  class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                  href="InvoiceManagement.html"
          >
            <svg
                    class="w-5 h-5"
                    aria-hidden="true"
                    fill="none"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
            >
              <path d="M4 6h16M4 10h16M4 14h16M4 18h16"></path>
            </svg>
            <span class="ml-4">Quản lí hóa đơn</span>
          </a>
        </li>
        <li class="relative px-6 py-3">
          <a
                  class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                  href="customerManagement.html"
          >
            <svg
                    class="w-5 h-5"
                    aria-hidden="true"
                    fill="none"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
            >
              <path d="M4 6h16M4 10h16M4 14h16M4 18h16"></path>
            </svg>
            <span class="ml-4">Quản lí khách hàng</span>
          </a>
        </li>
      </ul>

    </div>
  </aside>
  <!-- Mobile sidebar -->
  <!-- Backdrop -->
  <div class="flex flex-col flex-1 w-full">
    <header class="z-10 py-4 bg-white shadow-md dark:bg-gray-800">
      <div
              class="container flex items-center justify-between h-full px-6 mx-auto text-purple-600 dark:text-purple-300"
      >
        <!-- Mobile hamburger -->
        <button
                class="p-1 mr-5 -ml-1 rounded-md md:hidden focus:outline-none focus:shadow-outline-purple"
                @click="toggleSideMenu"
                aria-label="Menu"
        >
          <svg
                  class="w-6 h-6"
                  aria-hidden="true"
                  fill="currentColor"
                  viewBox="0 0 20 20"
          >
            <path
                    fill-rule="evenodd"
                    d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                    clip-rule="evenodd"
            ></path>
          </svg>
        </button>
        <!-- Search input -->
        <div class="flex justify-center flex-1 lg:mr-32">
          <div
                  class="relative w-full max-w-xl mr-6 focus-within:text-purple-500"
          >
            <div class="absolute inset-y-0 flex items-center pl-2">

            </div>
            <form action="/Project_CuaHangMuBaoHiem_war/find-bill" method="get">
              <input
                      class="pl-8 pr-2 text-sm text-gray-700 placeholder-gray-600 bg-gray-100 border-0 rounded-md dark:placeholder-gray-500 dark:focus:shadow-outline-gray dark:focus:placeholder-gray-600 dark:bg-gray-700 dark:text-gray-200 focus:placeholder-gray-500 focus:bg-white focus:border-purple-300 focus:outline-none focus:shadow-outline-purple form-input"
                      style="width: 450px"
                      type="text" name="text"
                      placeholder="Id hóa đơn"
              />
              <input type="submit" value="Tìm kiếm" style="width:80px;height: 36px;color: black;border-radius: 5px"></form>
          </div>
        </div>
        <ul class="flex items-center flex-shrink-0 space-x-6">
          <!-- Theme toggler -->
          <li class="flex">
            <button
                    class="rounded-md focus:outline-none focus:shadow-outline-purple"
                    @click="toggleTheme"
                    aria-label="Toggle color mode"
            >
              <template x-if="!dark">
                <svg
                        class="w-5 h-5"
                        aria-hidden="true"
                        fill="currentColor"
                        viewBox="0 0 20 20"
                >
                  <path
                          d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"
                  ></path>
                </svg>
              </template>
              <template x-if="dark">
                <svg
                        class="w-5 h-5"
                        aria-hidden="true"
                        fill="currentColor"
                        viewBox="0 0 20 20"
                >
                  <path
                          fill-rule="evenodd"
                          d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z"
                          clip-rule="evenodd"
                  ></path>
                </svg>
              </template>
            </button>
          </li>
          <!-- Notifications menu -->

          <!-- Profile menu -->
          <li class="relative">
            <button
                    class="align-middle rounded-full focus:shadow-outline-purple focus:outline-none"
                    @click="toggleProfileMenu"
                    @keydown.escape="closeProfileMenu"
                    aria-label="Account"
                    aria-haspopup="true"
            >
              <img
                      class="object-cover w-8 h-8 rounded-full"
                      src="https://images.unsplash.com/photo-1502378735452-bc7d86632805?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=aa3a807e1bbdfd4364d1f449eaa96d82"
                      alt=""
                      aria-hidden="true"
              />
            </button>
            <template x-if="isProfileMenuOpen">
              <ul
                      x-transition:leave="transition ease-in duration-150"
                      x-transition:leave-start="opacity-100"
                      x-transition:leave-end="opacity-0"
                      @click.away="closeProfileMenu"
                      @keydown.escape="closeProfileMenu"
                      class="absolute right-0 w-56 p-2 mt-2 space-y-2 text-gray-600 bg-white border border-gray-100 rounded-md shadow-md dark:border-gray-700 dark:text-gray-300 dark:bg-gray-700"
                      aria-label="submenu"
              >
                <li class="flex">
                  <a
                          class="inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
                          href="#"
                  >
                    <svg
                            class="w-4 h-4 mr-3"
                            aria-hidden="true"
                            fill="none"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            viewBox="0 0 24 24"
                            stroke="currentColor"
                    >
                      <path
                              d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"
                      ></path>
                    </svg>
                    <span>Hồ sơ</span>
                  </a>
                </li>
                <li class="flex">
                  <a
                          class="inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
                          href="#"
                  >
                    <svg
                            class="w-4 h-4 mr-3"
                            aria-hidden="true"
                            fill="none"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            viewBox="0 0 24 24"
                            stroke="currentColor"
                    >
                      <path
                              d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"
                      ></path>
                      <path d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                    </svg>
                    <span>Cài đặt</span>
                  </a>
                </li>
                <li class="flex">
                  <a
                          class="inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
                          href="#"
                  >
                    <svg
                            class="w-4 h-4 mr-3"
                            aria-hidden="true"
                            fill="none"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            viewBox="0 0 24 24"
                            stroke="currentColor"
                    >
                      <path
                              d="M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1"
                      ></path>
                    </svg>
                    <span>Đăng xuất</span>
                  </a>
                </li>
              </ul>
            </template>
          </li>
        </ul>
      </div>
    </header>
    <main class="h-full pb-16 overflow-y-auto">
      <div class="container grid px-6 mx-auto">
        <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
          Lịch sử hóa đơn
        </h2>
        <div style="display: flex">
          <!-- With actions -->

          <br><br>
          <%
            List<Bill> list = (List<Bill>) request.getAttribute("list");
          %>

        </div>

      </div>
      <div class="container grid px-6 mx-auto">
        <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
          Danh sách hóa đơn
        </h2>

        <!-- With actions -->
        <h4
                class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
        >

        </h4>
        <div class="w-full overflow-hidden rounded-lg shadow-xs">
          <div class="w-full overflow-x-auto">
            <table class="w-full whitespace-no-wrap">
              <thead>
              <tr
                      class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
              >
                <th class="px-4 py-3">Id hóa đơn</th>
                <th class="px-4 py-3">Đơn giá</th>
                <th class="px-4 py-3">Địa chỉ</th>
                <th class="px-4 py-3">Số điện thoại</th>
                <th class="px-4 py-3">Ngày lập đơn</th>
                <th class="px-4 py-3">Trạng thái</th>
              </tr>
              </thead>
              <tbody
                      class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
              >
              <%;
                for(Bill b:list){
              %>

              <tr class="text-gray-700 dark:text-gray-400">

                <td class="px-4 py-3">
                  <a href="/Project_CuaHangMuBaoHiem_war/detail-bill-history?id=<%=b.getId()%>">
                    <div class="flex items-center text-sm">
                      <!-- Avatar with inset shadow -->

                      <div>
                        <%=b.getId()%>
                      </div>
                    </div>
                  </a>
                </td>

                <td class="px-4 py-3 text-sm">
                  <a href="/Project_CuaHangMuBaoHiem_war/detail-bill-history?id=<%=b.getId()%>">
                    <% long price = 0;
                      for(String id_dp:b.getProductList()){
                        Product p = ProductService.getProduct(ProductService.getIdProduct(id_dp));
                        price += p.getPrice()-p.getPrice()*p.getDiscount();
                      }
                      NumberFormat nf = new NumberFormat();%>
                    <%=nf.numberFormat(price)%>đ
                  </a>
                </td>
                <td class="px-4 py-3 text-sm">
                  <a href="/Project_CuaHangMuBaoHiem_war/detail-bill-history?id=<%=b.getId()%>">
                    <%=b.getAddress()%>
                  </a>
                </td>
                <td class="px-4 py-3 text-sm">
                  <a href="/Project_CuaHangMuBaoHiem_war/detail-bill-history?id=<%=b.getId()%>">
                    <%=b.getPhone()%>
                  </a>
                </td>
                <td class="px-4 py-3 text-sm">
                  <a href="/Project_CuaHangMuBaoHiem_war/detail-bill-history?id=<%=b.getId()%>">
                    <%=b.getDate()%>
                  </a>
                </td>
                <td class="px-4 py-3 text-sm">
                  <a href="/Project_CuaHangMuBaoHiem_war/detail-bill-history?id=<%=b.getId()%>">
                    <%=b.getStatus()%>
                  </a>
                </td>

              </tr>
              <%}%>
              </tbody>
            </table>
          </div>
          <div
                  class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800"
          >
                <span class="flex items-center col-span-3">
                  Showing 21-30 of 100
                </span>
            <span class="col-span-2"></span>
            <!-- Pagination -->
            <span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
                  <nav aria-label="Table navigation">
                    <ul class="inline-flex items-center">
                      <li>
                        <button
                                class="px-3 py-1 rounded-md rounded-l-lg focus:outline-none focus:shadow-outline-purple"
                                aria-label="Previous"
                        >
                          <svg
                                  class="w-4 h-4 fill-current"
                                  aria-hidden="true"
                                  viewBox="0 0 20 20"
                          >
                            <path
                                    d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
                                    clip-rule="evenodd"
                                    fill-rule="evenodd"
                            ></path>
                          </svg>
                        </button>
                      </li>
                      <li>
                        <button
                                class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple"
                        >
                          1
                        </button>
                      </li>
                      <li>
                        <button
                                class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple"
                        >
                          2
                        </button>
                      </li>
                      <li>
                        <button
                                class="px-3 py-1 text-white transition-colors duration-150 bg-purple-600 border border-r-0 border-purple-600 rounded-md focus:outline-none focus:shadow-outline-purple"
                        >
                          3
                        </button>
                      </li>
                      <li>
                        <button
                                class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple"
                        >
                          4
                        </button>
                      </li>
                      <li>
                        <span class="px-3 py-1">...</span>
                      </li>
                      <li>
                        <button
                                class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple"
                        >
                          8
                        </button>
                      </li>
                      <li>
                        <button
                                class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple"
                        >
                          9
                        </button>
                      </li>
                      <li>
                        <button
                                class="px-3 py-1 rounded-md rounded-r-lg focus:outline-none focus:shadow-outline-purple"
                                aria-label="Next"
                        >
                          <svg
                                  class="w-4 h-4 fill-current"
                                  aria-hidden="true"
                                  viewBox="0 0 20 20"
                          >
                            <path
                                    d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                                    clip-rule="evenodd"
                                    fill-rule="evenodd"
                            ></path>
                          </svg>
                        </button>
                      </li>
                    </ul>
                  </nav>
                </span>
          </div>
        </div>
      </div>
    </main>
  </div>
</div>
</body>
</html>
