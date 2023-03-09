<template>
    <div>
        <van-nav-bar
                title="订单详情"
                left-text="返回"
                left-arrow
                @click-left="onClickLeft"
        />
        <div style="height:50px;display:block;"></div>

    </div>

</template>

<script>
    export default {
        create(){
            console.log("查看订单详情");
        },
        data(){
            return{
            }
        },
        methods:{
            onClickLeft(){
                this.$router.push("/myOrder");
            }
        }
    }
</script>

<style scoped>

</style>
