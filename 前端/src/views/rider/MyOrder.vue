<template>
    <div>
        <h4 v-if="deliveryInfo.did === 4">待送寝订单</h4>
        <h4 v-else>我所接的订单</h4>

        <van-card v-for="(order,index) in myOrders" :key="index">
            <template #title>
                <div style="width: 200px">
                    <h3 class="line-limit-length" style="margin: 5px;width: 90px;display: inline-block;text-align: left;">{{order.shop.shopName}}</h3>
                    <span style="margin: 5px;float: right" v-if="order.order.orderStat===3">
                            等待送达
                    </span>
                    <span style="margin: 5px;float: right" v-if="order.order.orderStat===4">
                            已送达
                    </span>
                </div>
            </template>
            <template #num>
                <span style="font-size: 15px;color: crimson">配送费￥{{order.order.deliveryPrice}}</span>
            </template>
            <template #thumb>
                <img :src="order.shop.logoSrc" style="width: 90px" alt=""/>
            </template>
            <template #desc>
                <div style="text-align: left;font-size: 12px;margin-left: 10px;margin-bottom: 10px">
                    <span>取货地址：{{order.shop.addressDetail}}</span>
                </div>
                <div style="text-align: left;font-size: 12px;margin-left: 10px;margin-bottom: 10px">
                    <span>收货地址：{{order.address.address}}</span>
                </div>
                <div style="text-align: left;font-size: 13px;margin-left: 10px">
                    <span>下单时间：{{order.order.createTime}}</span>
                </div>
                <div style="text-align: left;font-size: 15px;margin-left: 10px" v-if="order.order.orderStat === 3">
                    <span>订单状态：待送达</span>
                </div>
                <div style="text-align: left;font-size: 15px;margin-left: 10px" v-if="order.order.orderStat === 4">
                    <span>订单状态：已送达</span>
                </div>
            </template>
            <template #footer>
                <van-button round hairline style="width: 80px" size="small" type="primary" @click="deliverySuccess(order)" v-if="order.order.orderStat === 3">已送达</van-button>
                <van-button round hairline style="width: 80px" size="small" type="primary" @click="hidden(index)" v-show="deliveryInfo.did === 4">已到宿舍楼</van-button>
                <van-button round hairline style="width: 80px" size="small" type="info" @click="orderInfo(order)" v-show="deliveryInfo.did !== 4">查看详情</van-button>
            </template>
        </van-card>


        <div v-if="myOrders.length === 0">
            <van-empty description="您还没有接单噢~~去订单广场看看吧！！" />
        </div>
        <!--填充-->
        <div style="height:50px;display:block;"></div>

    </div>

</template>

<script>
    import { Dialog } from 'vant';
    import { Notify } from 'vant';
    export default {
        name: "MyOrder",
        created(){
          this.deliveryInfo = this.$store.getters.getRider;

          if (this.deliveryInfo.did === 4){
            this.axios.get("http://localhost:8084/getAllOrderByDid",{
              params:{
                did: 6
              }
            }).then(resp=>{
              console.log(resp.data);
              this.myOrders = resp.data;
            })
          }


          this.axios.get("http://localhost:8084/getAllOrderByDid",{
              params:{
                  did: this.deliveryInfo.did
              }
          }).then(resp=>{
              console.log(resp.data);
              this.myOrders = resp.data;
          })
        },
        data(){
            return{
                did:'',
                deliveryInfo:'',
                myOrders:[
                    {

                    }
                ]
            }
        },
        methods:{
            //已送达，改变订单状态
            deliverySuccess(order){
                console.log(order);
                Dialog.confirm({
                    title: '提示',
                    message: '确定已经送达吗？',
                }).then(() => {
                        console.log(order);
                        this.axios.get("http://localhost:8084/deliverySuccess",{
                            params:{
                                oid:order.order.oid
                            }
                        }).then(resp => {
                            if (resp.data === "success") {
                                Notify({ type: 'success', message: '送单成功' });
                                this.flush();
                            } else {
                                Notify({ type: 'danger', message: '送单失败' });
                                this.flush();
                            }
                        })
                    })
                    .catch(() => {
                        Notify({ type: 'warning', message: '取消' });
                    });
            },

            hidden(index){
             this.myOrders.splice(index,1)
            },

            orderInfo(order){
                console.log(order);
                this.$router.push({
                    name:"orderDetail",
                    params:{
                        orderInfo:order
                    }
                })
            },
            //刷新
            flush(){
                this.$router.push({
                    name:"blank_rider",
                    params:{
                        url:"myOrder"
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
