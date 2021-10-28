package com.sck.service.impl;

import com.sck.dao.StudentMapper;
import com.sck.pojo.Stu_org;
import com.sck.pojo.Student;
import com.sck.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    StudentMapper studentMapper;
    @Override
    public Student findByNum(String num) {
        return studentMapper.findByNum(num);
    }

    @Override
    public Student checkstu(String num, String IdCard, String name, String phone) {
        return studentMapper.checkstu(num,IdCard,name,phone);
    }

    @Override
    public int updatepwd(String num, String pwd) {
        return studentMapper.updatepwd(num,pwd);
    }

    @Override
    public int addStudent(Student student) {
        return studentMapper.addStudent(student);
    }

    @Override
    public int alterinfo(Student student) {
        return studentMapper.alterinfo(student);
    }

    @Override
    public List<Stu_org> showstudentlist(Integer org_id) {
        return studentMapper.showstudentlist(org_id);
    }

    @Override
    public List<Stu_org> showstudentlistFilter(Integer org_id, String stuname, String classroom) {
        return studentMapper.showstudentlistFilter(org_id, stuname, classroom);
    }

    @Override
    public List<Student> showallstu() {
        return studentMapper.showallstu();
    }

    @Override
    public List<Student> showallstuFilter(String stuname, String classroom) {
        return studentMapper.showallstuFilter(stuname, classroom);
    }

    @Override
    public int delstu(String num) {
        return studentMapper.delstu(num);
    }
}
