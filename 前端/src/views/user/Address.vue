<template>
    <div>
        <slot><van-nav-bar
                title="地址列表"
                left-text="返回"
                left-arrow
                @click-left="onClickLeft"
        /></slot>
        <div v-if="list.length === 0">
            <van-empty description="您还没有添加地址噢，点击新增地址添加吧~~" />
        </div>
        <van-address-list
                v-model="chosenAddressId"
                :list="list"
                @add="onAdd"
                @edit="onEdit"
        />
    </div>

</template>

<script>
    /*引入Toast*/
    import Toast from 'vant/lib/toast';

    export default {
        name: "Address",
        created(){
            console.log(this.$store.getters.getUser.id);
            this.axios.get("http://localhost:8084/listAddress",{
                params:{
                    uid: this.$store.getters.getUser.id
                }
            }).then(resp=>{
                console.log(resp.data);
                this.list = resp.data
            })
        },
        data() {
            return {
                chosenAddressId: 0,
                list: [
                ],
                disabledList: [
                    {
                        id: '',
                        name: '',
                        tel: '',
                        address: '',
                    },
                ],
            };
        },
        methods: {
            onAdd() {
                //Toast('新增地址');
                this.$router.push('/addressAdd')
            },
            onEdit(item, index) {
                //Toast('编辑地址:' + index);
                //console.log(item)
                let data = JSON.stringify(item);
                this.$router.push({
                    name:'addressEdit',
                    params:{
                        addressMessage:data
                    }
                })
            },
            onClickLeft(){
                this.$router.push('/my_user');
            }
        },
    }
</script>

<style scoped>

</style>
