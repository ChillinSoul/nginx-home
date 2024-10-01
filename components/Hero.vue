<template>
    <div class="h-screen w-screen relative pt-16">
        <div class="absolute top-0 z-[-2] h-screen w-screen bg-[#000000] bg-[radial-gradient(#ffffff33_1px,#00091d_1px)] bg-[size:20px_20px]"></div>
        <div class="flex flex-col items-center justify-center h-full text-white">
            <h1 class="text-5xl font-bold ">Distributed systems</h1>
            <p> Master 2 Computer Science Project</p>
            <div class="m-4 flex flex-col justify-center gap-4">
                <Nuxt-link to="/nuxt-app/" class="text-white bg-blue-500 px-4 py-2 rounded-md">Manneken Data </Nuxt-link>
                <APITest />
            </div>
        </div>
    </div>
</template>

