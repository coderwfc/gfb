<template>
    <div>
        <span><h4>我的订单</h4></span>
        <van-card  v-for="(order,index) in orders" :key="index" @click="toOrderInfo(order)">
            <template #title>
                <div style="width: 200px">
                    <h3 class="line-limit-length" style="margin: 5px;width: 90px;display: inline-block;text-align: left;">{{order.shopName}}</h3>
                    <span style="margin: 5px;float: right;width: 75px" v-if="order.orderStat===1">
                            等待商家接单
                    </span>
                    <span style="margin: 5px;float: right" v-if="order.orderStat===2">
                            等待骑手接单
                    </span>
                    <span style="margin: 5px;float: right" v-if="order.orderStat===3">
                            等待送达
                    </span>
                    <span style="margin: 5px;float: right" v-if="order.orderStat===4">
                            已送达
                    </span>

                </div>
            </template>
            <template #num>
                <span style="font-size: 15px;color: crimson">￥{{order.totalPrice}}</span>
            </template>
            <template #thumb>
                <img :src="order.logoSrc" style="width: 90px;height: 80px" alt=""/>
            </template>
            <template #desc>
                <div style="text-align: left;font-size: 15px;margin-left: 10px">
                    <span>{{order.createTime}}</span>
                </div>

            </template>

<!--            <template #footer>-->
<!--                <van-button round hairline style="width: 80px" type="small">删除订单</van-button>-->
<!--            </template>-->
        </van-card>
        <div v-if="orders.length === 0">
            <van-empty description="您还没有订单噢~~现在去下单吧！！" />
        </div>
        <!--填充-->
        <div style="height:50px;display:block;"></div>
    </div>
</template>

<script>
    import Toast from "vant/lib/toast";

    export default {
        name: "Order",
        created(){
            const uid = JSON.stringify(this.$store.getters.getUser.id);
            console.log(uid);
            this.axios.get("http://localhost:8084/findAllOrderByUid",{
                params:{
                    uid:uid
                }
            }).then(resp=>{
                console.log(resp.data);
                this.orders  = resp.data;
            })
        },
        data(){
            return{
                uid:'',
                orders:[
                    {

                    },
                ],
            }
        },
        methods:{
            // deleteOrder(id){
            //     Toast("删除订单"+id);
            //     console.log(id)
            // },

            toOrderInfo(order){
                console.log(order);
                this.$router.push({
                    name:"orderInfo_user",
                    params:{
                        orderInfo: order
                    }
                })
            }
        }
    }
</script>

<style scoped>
    .line-limit-length {

        overflow: hidden;

        text-overflow: ellipsis;

        white-space: nowrap;

    }
</style>
