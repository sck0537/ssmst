package com.sck.service.impl;

import com.sck.dao.GoodsMapper;
import com.sck.pojo.Goods;
import com.sck.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
@Service
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    GoodsMapper goodsMapper;
    @Override
    public int deleGoodsByOrgId(Integer org_id) {
        return goodsMapper.deleGoodsByOrgId(org_id);
    }

    @Override
    public List<Goods> showallGoogs(Integer org_id) {
        return goodsMapper.showallGoogs(org_id);
    }

    @Override
    public List<Goods> showallGoogsName(Integer org_id, String GoodsName) {
        return goodsMapper.showallGoogsName(org_id,GoodsName);
    }

    @Override
    public Goods findGoodsByid(Integer id) {
        return goodsMapper.findGoodsByid(id);
    }

    @Override
    public int alterGoods(Integer id, String name, Integer num) {
        return goodsMapper.alterGoods(id, name, num);
    }

    @Override
    public int delgoods(Integer id) {
        return goodsMapper.delgoods(id);
    }

    @Override
    public int addgoods(String name, Integer num, Integer organiza) {
        return goodsMapper.addgoods(name, num, organiza);
    }
}
