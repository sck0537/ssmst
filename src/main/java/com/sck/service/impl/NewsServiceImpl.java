package com.sck.service.impl;

import com.sck.dao.NewsMapper;
import com.sck.pojo.News;
import com.sck.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
@Service
public class NewsServiceImpl implements NewsService {
    @Autowired
    NewsMapper newsMapper;
    @Override
    public List<News> findByOrg(int org_num) {
        return newsMapper.findByOrg(org_num);
    }

    @Override
    public List<News> findBystuNumAndRole(String num, Integer stu_statu) {
        return newsMapper.findBystuNumAndRole(num,stu_statu);
    }

    @Override
    public List<News> findBystuNumAndRoleFilter(String num, Integer stu_statu, String orgname) {
        return newsMapper.findBystuNumAndRoleFilter(num, stu_statu, orgname);
    }

    @Override
    public int editornews(Integer id, String detail) {
        return newsMapper.editornews(id, detail);
    }

    @Override
    public int delnews(Integer id) {
        return newsMapper.delnews(id);
    }

    @Override
    public int createnews(News news) {
        return newsMapper.createnews(news);
    }
}
